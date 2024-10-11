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
    /// Логика взаимодействия для ListViewPage.xaml
    /// </summary>
    public partial class ListViewPage : Page
    {
        public ListViewPage()
        {
            InitializeComponent();
            UsersListView.ItemsSource = Models.SportInventoryDBEntities.GetContext().Users.ToList();
        }

        private void AddNewUserButton_Click(object sender, RoutedEventArgs e)
        {
            Utils.Navigation.ActiveFrame.Navigate(new Pages.EditPage(new Models.Users(), true));
        }

        private void EditUserButton_Click(object sender, RoutedEventArgs e)
        {
            Utils.Navigation.ActiveFrame.Navigate(new Pages.EditPage((sender as Button).DataContext as Models.Users, false));
        }
    }
}
