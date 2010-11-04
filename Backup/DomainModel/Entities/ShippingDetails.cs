using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace DomainModel.Entities
{
    public class ShippingDetails : IDataErrorInfo
    {
        public string Name { get; set; }
        public DateTime BirthOfDay { get; set; }
        public string Career { get; set; }
        public string HomePhone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }
        public bool GiftWrap { get; set; }

        public string this[string columnName] // Validation rules
        {
            get
            {
                if ((columnName == "Name") && string.IsNullOrEmpty(Name))
                    return "Vui lòng điền tên!";
                if ((columnName == "Address") && string.IsNullOrEmpty(Address))
                    return "Vui lòng điền địa chỉ!";
                if ((columnName == "City") && string.IsNullOrEmpty(City))
                    return "Vui lòng điền tên thành phố!";
                //if ((columnName == "State") && string.IsNullOrEmpty(State))
                //    return "Vui lòng điền bang bạn đang sống!";
                if ((columnName == "Country") && string.IsNullOrEmpty(Country))
                    return "Vui lòng điền tên quốc gia bạn đang sống!";
                if ((columnName == "Email") && string.IsNullOrEmpty(Email))
                    return "Vui lòng điền hộp thư điện tử liên lạc của bạn!";

                if ((columnName == "BirthOfDay") && string.IsNullOrEmpty(Email))
                    return "Vui lòng điền ngày sinh của bạn!";
                return null;
            }
        }

        public string Error { get { return null; } } // Not required
    }
}
