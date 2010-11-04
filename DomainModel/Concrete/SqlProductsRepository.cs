using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DomainModel.Entities;
using DomainModel.Abstract;
using System.Data.Linq;
using System.ComponentModel;

namespace DomainModel.Concrete
{
    public class SqlProductsRepository : IProductsRepository
    {
        private Table<Product> productsTable;
        public SqlProductsRepository(string connectionString)
        {
            productsTable = (new DataBaseXeHoiDataContext(connectionString)).GetTable<Product>();
        }
        public IQueryable<Product> Products
        {
            get { return productsTable; }
        }

        public void SaveProduct(Product product)
        {
            if (product.ID == 0)
            {
                productsTable.InsertOnSubmit(product);
            }
            else
            {               
                productsTable.Attach(product);
                productsTable.Context.Refresh(RefreshMode.KeepCurrentValues, product);
            }
            productsTable.Context.SubmitChanges();
        }

        private void EnsureValid(IDataErrorInfo validatable, params string[] properties)
        {
            if (properties.Any(x => validatable[x] != null))
                throw new InvalidOperationException("The object is invalid.");
        }

        public void DeleteProduct(Product product)
        {
            productsTable.DeleteOnSubmit(product);
            productsTable.Context.SubmitChanges();
        }

        public List<RSSItem> GetRSS()
        {
            var getlistrss =  (from p in productsTable
                    orderby p.ID descending
                    select new RSSItem{name = p.Name , description = p.Description}).Take(10).Skip(1);

            return (List<RSSItem>)getlistrss.ToList();
        }

    }
}
