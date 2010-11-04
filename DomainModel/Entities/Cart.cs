using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DomainModel.Entities
{
    public class Cart
    {
        private List<CartLine> lines = new List<CartLine>();
        public IList<CartLine> Lines { get { return lines.AsReadOnly(); } }

        private ShippingDetails shippingDetails = new ShippingDetails();
        public ShippingDetails ShippingDetails { get { return shippingDetails; } }

        public void AddItem(Product product, int quantity)
        {
            var line = lines
            .FirstOrDefault(l => l.Product.ID == product.ID);
            if (line == null)
                lines.Add(new CartLine { Product = product, Quantity = quantity });
            else
                line.Quantity += quantity;
        }

        public decimal ComputeTotalValue()
        {
            return lines.Sum(l => (int)l.Product.Price * l.Quantity);
        }

        public void Clear()
        {
            lines.Clear();
        }

        public void RemoveLine(Product product)
        {
            lines.RemoveAll(l => l.Product.ID == product.ID);
        }
    }
    public class CartLine
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
    }
}
