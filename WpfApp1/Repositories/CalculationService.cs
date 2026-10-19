using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp1.Repositories
{
    public class CalculationService
    {
        private readonly string _connectionString = @"Data Source=DESKTOP-HPIB8IV\SQLEXPRESS;Initial Catalog=Aroma_Dom_6_var;Integrated Security=True;TrustServerCertificate=True;";
        public int CalculateProductCount(int productTypeId, int materialTypeId, int rawMaterialQuantity, double param1, double param2)
        {
            //тут происходит проверка на "не те" данные (отриц или нуль параметры)
            if (rawMaterialQuantity <= 0 || param1 <= 0 || param2 <= 0)
            {
                return -1;
            }
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    connection.Open();

                    //коэффициент типа продукции из БД поулчен:
                    string queryProduct = "SELECT product_coefficient FROM product_type WHERE product_type_id = @id";
                    SqlCommand cmdProduct = new SqlCommand(queryProduct, connection);
                    cmdProduct.Parameters.AddWithValue("@id", productTypeId);
                    object coefObj = cmdProduct.ExecuteScalar();
                    if (coefObj == null) return -1; //елси нет
                    double productCoefficient = Convert.ToDouble(coefObj);
                    //процент потери сырья из БД получен
                    string queryMaterial = "SELECT loss_percent FROM material_type WHERE material_type_id = @id";
                    SqlCommand cmdMaterial = new SqlCommand(queryMaterial, connection);
                    cmdMaterial.Parameters.AddWithValue("@id", materialTypeId);
                    object lossObj = cmdMaterial.ExecuteScalar();
                    if (lossObj == null) return -1;
                    double lossPercent = Convert.ToDouble(lossObj);
                    //логика по задаче:
                    double requiredRawPerUnit = param1 * param2 * productCoefficient;
                    //на ноль делить нельзя
                    if (requiredRawPerUnit <= 0) return -1;
                    //сколько продукции можно сделать из имеющегося:
                    double maxPossibleProducts = rawMaterialQuantity / requiredRawPerUnit;
                    //учитываем потери
                    double productWithLosses = maxPossibleProducts * (1 - (lossPercent / 100.0));
                    //ретёрн целого числа (без дробь части)
                    return (int)Math.Floor(productWithLosses);
                }
            }
            catch
            {
                return -1;
            }
        }
    }
}