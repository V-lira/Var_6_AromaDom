using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using WpfApp1.Models;

namespace AromaDomApp.Repositories
{
    public class MaterialRepository
    {
        private readonly string _connectionString = @"Data Source=DESKTOP-HPIB8IV\SQLEXPRESS;Initial Catalog=Aroma_Dom_6_var;Integrated Security=True;TrustServerCertificate=True;";
        public List<Material> GetAllMaterials()
        {
            var materials = new List<Material>();

            //по запросу: соединение материала, типа и рецептуры, чтобы сразу посчитать
            string query = @"SELECT  m.material_id, mt.material_type_name, m.material_name, m.price, m.unit_name, m.stock_quantity, m.min_quantity, ISNULL(SUM(r.quantity_per_unit), 0) AS required_quantity
            FROM material m JOIN material_type mt ON m.material_type_id = mt.material_type_id LEFT JOIN recipe r ON m.material_id = r.material_id
            GROUP BY m.material_id, mt.material_type_name, m.material_name, m.price, m.unit_name, m.stock_quantity, m.min_quantity";

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var material = new Material
                            {
                                MaterialId = reader.GetInt32(0),
                                MaterialTypeName = reader.GetString(1),
                                MaterialName = reader.GetString(2),
                                Price = reader.GetDecimal(3),
                                UnitName = reader.GetString(4),
                                StockQuantity = reader.GetDecimal(5),
                                MinQuantity = reader.GetDecimal(6),
                                //вот расчет:
                                RequiredQuantity = reader.GetDecimal(7)
                            };
                            materials.Add(material);
                        }
                    }
                }
            }
            return materials;
        }
    }
}