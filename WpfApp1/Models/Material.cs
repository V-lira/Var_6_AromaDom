using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfApp1.Models
{
    public class Material
    {
        public int MaterialId { get; set; }
        public string MaterialTypeName { get; set; }
        public string MaterialName { get; set; }
        public decimal Price { get; set; }
        public string UnitName { get; set; }
        public decimal StockQuantity { get; set; }
        public decimal MinQuantity { get; set; }
        public decimal RequiredQuantity { get; set; }
    }
}