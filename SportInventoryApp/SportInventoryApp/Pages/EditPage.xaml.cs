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

namespace SportInventoryApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditPage.xaml
    /// </summary>
    public partial class EditPage : Page
    {
        public bool IsAdding = false;
        public Models.Users CurrentUser = null;
        public EditPage(Models.Users user, bool flag)
        {
            InitializeComponent();
            IsAdding = flag;
            if (user != null)
            {
                CurrentUser = user;
            }
        }

        public void Init()
        {
            var Roles = Models.SportInventoryDBEntities.GetContext().Role.ToList();
            Roles.Insert(0, new Models.Role() { Name = "Выберите роль"});
            if (IsAdding != false)
            {
                
            }
        }

        public void Update()
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Utils.Navigation.ActiveFrame.CanGoBack)
            {
                Utils.Navigation.ActiveFrame.GoBack();
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
