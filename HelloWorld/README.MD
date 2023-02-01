To enable development endpont to Dynamics Business Central Administrator Shell, follow these steps

1. Run the following commnd to enable developer endpoint
```sh
Set-NAVServerConfiguration -KeyName DeveloperServicesEnabled -KeyValue true
```
2. Restart NAV Server instance
```sh
Restart-NAVServerInstance
```
3. Check Nav Server configuration developer endpoint
```sh
Get-NAVServerConfiguration -KeyName DeveloperServicesEnabled
```
4. Check all NAV Server Configuration
```sh
Get-NAVServerConfiguration
```
5. Setup PublicWebBaseUrl in NavServerConfiguration while publish extension in Dynamics 365 Business Central
```sh
Set-NAVServerConfiguration -KeyName PublicWebBaseUrl -KeyValue "http://localhost:8080/BC210/"
```
6. Then again Restart NAV Server instance
```sh
Restart-NAVServerInstance
```
