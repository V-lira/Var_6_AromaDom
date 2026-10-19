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
    /// Логика взаимодействия для ProductListWindow.xaml
    /// </summary>
    public partial class ProductListWindow : Window
    {
        private readonly Material _material;
        private readonly string _connectionString = @"Data Source=DESKTOP-HPIB8IV\SQLEXPRESS;Initial Catalog=Aroma_Dom_6_var;Integrated Security=True;TrustServerCertificate=True;";
        public ProductListWindow(Material material)
        {
            InitializeComponent();
            _material = material;
            HeaderText.Text = $"Продукция, где используется: {_material.MaterialName}";
            LoadProducts();
        }

        private void LoadProducts()
        {
            var products = new List<ProductRecipe>();
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    connection.Open();
                    //по запросу: берем артикул, имя продукта и клл-во из рецепта
                    string query = @"SELECT p.article, p.product_name, r.quantity_per_unit FROM recipe r JOIN product p ON r.product_id = p.product_id WHERE r.material_id = @materialId";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@materialId", _material.MaterialId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            products.Add(new ProductRecipe
                            {
                                Article = reader.GetString(0),
                                ProductName = reader.GetString(1),
                                QuantityPerUnit = reader.GetDecimal(2)
                            });
                        }
                    }
                }
                ProductsDataGrid.ItemsSource = products;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки продукции: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}