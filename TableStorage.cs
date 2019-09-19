using System;
using System.Threading.Tasks;
using Microsoft.Azure.Cosmos.Table;

namespace ConsoleApp13
{
    class Program
    {

        private string connectionString = "DefaultEndpointsProtocol=https;AccountName=wednesdaystorage;AccountKey=U4BBVPhXpEUEQgct1fDxy4ZvlG2pe45eFCs117YntM7re50tDMN6r2FK0blEhk+P1Qu6pVhNrfMfpg77VfHozQ==;EndpointSuffix=core.windows.net";
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Program p = new Program();
            p.InsertTable().GetAwaiter().GetResult();
            Console.ReadKey();
        }

        public async Task InsertTable() {
            CloudStorageAccount account = CloudStorageAccount.Parse(connectionString);
            CloudTableClient client = account.CreateCloudTableClient();
            CloudTable ct =  client.GetTableReference("wednesdaytable");
            EmployeeEntity employee = new EmployeeEntity("Telengana", "Hyderabad");
            employee.EmployeeAge = 10;
            employee.EmployeeName = "Tom SMith";

            TableOperation operation = TableOperation.Insert(employee);
            await ct.ExecuteAsync(operation);
            Console.WriteLine("Employee added !!");
        }
    }

    public class EmployeeEntity : TableEntity {
        public EmployeeEntity(string state, string city)
        {
            PartitionKey = state;
            RowKey = city;
        }

        public string EmployeeName { get; set; }
        public int EmployeeAge { get; set; }
    }
}
