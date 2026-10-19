using AromaDomApp.Repositories;
using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfApp1.Models;
using WpfApp1.Repositories;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly MaterialRepository _materialRepository;
        public MainWindow()
        {
            InitializeComponent();
            _materialRepository = new MaterialRepository();

            LoadMaterials();
        }
        private void LoadMaterials()
        {
            //списко беретя из репозитория и привязывается к айтемс контрол
            var materials = _materialRepository.GetAllMaterials();
            MaterialsItemsControl.ItemsSource = materials;
        }

        private void AddMaterialButton_Click(object sender, RoutedEventArgs e)
        {
            //нул л тут: окей, слушаю
            var editWindow = new MaterialEditWindow(null);
            editWindow.ShowDialog();
            LoadMaterials();
        }
        private void MaterialCard_MouseLeftButtonUp(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            //клик - материал показывает
            var border = sender as Border;
            if (border != null && border.DataContext is Material selectedMaterial)
            {
                //выбран матриал - редач - показывает
                var editWindow = new MaterialEditWindow(selectedMaterial);
                editWindow.ShowDialog();
                LoadMaterials();
            }
        }
        private void ViewProductsButton_Click(object sender, RoutedEventArgs e)
        {
            //матриал показывает, к которому кнопка привязана
            var button = sender as Button;
            if (button != null && button.DataContext is Material selectedMaterial)
            {
                var productWindow = new ProductListWindow(selectedMaterial);
                productWindow.ShowDialog();
            }
        }
        private void TestMethodButton_Click(object sender, RoutedEventArgs e)
        {
            //серсив:
            var calcService = new Repositories.CalculationService();
            //метод:
            // productTypeId = 1 (классичк свеча)
            // materialTypeId = 1 (соевый воск)
            // rawMaterialQuantity = 10 (кг)
            // param1 = 2, param2 = 3
            int result = calcService.CalculateProductCount(1, 1, 10, 2.0, 3.0);

            if (result == -1)
            {
                MessageBox.Show("Ошибка расчета. Проверьте входные данные или БД", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                MessageBox.Show($"Из заданного количества сырья получится продукции: {result} шт.", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}
