using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using WpfApp1.Models;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MaterialEditWindow.xaml
    /// </summary>
    public partial class MaterialEditWindow : Window
    {
        //есои нулл - добавим, если естт - эдит
        private readonly Material _currentMaterial;
        private readonly string _connectionString = @"Data Source=DESKTOP-HPIB8IV\SQLEXPRESS;Initial Catalog=Aroma_Dom_6_var;Integrated Security=True;TrustServerCertificate=True;";

        public MaterialEditWindow(Material material)
        {
            InitializeComponent();
            _currentMaterial = material;
            LoadMaterialTypes();

            if (_currentMaterial != null)
            {
                HeaderText.Text = "Редактирование материала";
                Title = "Редактирование материала";
                FillFields();
            }
        }

        private void LoadMaterialTypes()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    connection.Open();
                    string query = "SELECT material_type_id, material_type_name FROM material_type";
                    SqlCommand command = new SqlCommand(query, connection);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            MaterialTypeComboBox.Items.Add(new MaterialType
                            {
                                MaterialTypeId = reader.GetInt32(0),
                                MaterialTypeName = reader.GetString(1)
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError($"Ошибка при загрузке типов материалов: {ex.Message}");
            }
        }

        private void FillFields()
        {
            //поля заполняем:
            NameTextBox.Text = _currentMaterial.MaterialName;
            PriceTextBox.Text = _currentMaterial.Price.ToString("F2");
            UnitTextBox.Text = _currentMaterial.UnitName;
            StockQuantityTextBox.Text = _currentMaterial.StockQuantity.ToString();
            MinQuantityTextBox.Text = _currentMaterial.MinQuantity.ToString();
            //тип комбобокса:
            foreach (MaterialType item in MaterialTypeComboBox.Items)
            {
                if (item.MaterialTypeName == _currentMaterial.MaterialTypeName)
                {
                    MaterialTypeComboBox.SelectedItem = item;
                    break;
                }
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            ///////////////////// ПРОВЕРКА ВВЕДЕННЫХ ДАННЫХ
            if (MaterialTypeComboBox.SelectedItem == null)
            {
                ShowWarning("Пожалуйста, выберите тип материала.");
                return;
            }

            if (string.IsNullOrWhiteSpace(NameTextBox.Text))
            {
                ShowWarning("Наименование материала не может быть пустым.");
                return;
            }
            // цена
            if (!decimal.TryParse(PriceTextBox.Text, out decimal price) || price < 0)
            {
                ShowError("Цена должна быть числом и не может быть отрицательной. (Пример: 450.00)");
                return;
            }
            if (string.IsNullOrWhiteSpace(UnitTextBox.Text))
            {
                ShowWarning("Укажите единицу измерения (кг, л, шт и т.д)");
                return;
            }
            // кол-во
            if (!decimal.TryParse(PackageQuantityTextBox.Text, out decimal packageQty) || packageQty <= 0)
            {
                ShowError("Кол-во в упаковке должно быть больше нуля!!");
                return;
            }
            if (!decimal.TryParse(StockQuantityTextBox.Text, out decimal stockQty) || stockQty < 0)
            {
                ShowError("Кол-во на складе не может быть отрицательным!!");
                return;
            }
            if (!decimal.TryParse(MinQuantityTextBox.Text, out decimal minQty) || minQty < 0)
            {
                ShowError("Мин кол-во не может быть отрицательным!!");
                return;
            }
            int typeId = ((MaterialType)MaterialTypeComboBox.SelectedItem).MaterialTypeId;
            ////////////////////СОХРАНЕНИЕ В БАЗУ ДАННЫХ
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    connection.Open();
                    string query;

                    if (_currentMaterial == null)
                    {
                        // ДОБАВЛЕНИЕ ТУТ:
                        query = @"INSERT INTO material (material_type_id, material_name, price, unit_name, package_quantity, stock_quantity, min_quantity) VALUES (@typeId, @name, @price, @unit, @package, @stock, @min)";
                    }
                    else
                    {
                        //ЭДИТ:
                        query = @"UPDATE material SET material_type_id = @typeId, material_name = @name, price = @price, unit_name = @unit, package_quantity = @package, stock_quantity = @stock, min_quantity = @min WHERE material_id = @id";
                    }
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@typeId", typeId);
                    command.Parameters.AddWithValue("@name", NameTextBox.Text.Trim());
                    command.Parameters.AddWithValue("@price", price);
                    command.Parameters.AddWithValue("@unit", UnitTextBox.Text.Trim());
                    command.Parameters.AddWithValue("@package", packageQty);
                    command.Parameters.AddWithValue("@stock", stockQty);
                    command.Parameters.AddWithValue("@min", minQty);

                    if (_currentMaterial != null)
                    {
                        command.Parameters.AddWithValue("@id", _currentMaterial.MaterialId);
                    }
                    command.ExecuteNonQuery();
                }
                //ура, успех
                DialogResult = true;
                Close();
            }
            catch (Exception ex)
            {
                ShowError($"Ошибка при сохранении в базу данных: {ex.Message}");
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            //не успех:
            DialogResult = false;
            Close();
        }

        //обработка искл:

        private void ShowError(string message)
        {
            MessageBox.Show(message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        private void ShowWarning(string message)
        {
            MessageBox.Show(message, "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
        }
    }
}