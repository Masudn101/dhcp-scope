# Define parameters for DHCP scope
$ScopeName = "Scope3"
$StartRange = "192.168.30.2"
$EndRange = "192.168.30.200"
$SubnetMask = "255.255.255.0"
$Router = "192.168.30.1"
$DNS1 = "8.8.8.8"
$DNS2 = "8.8.4.4"

# Import DHCP module
Import-Module DHCP

# Create DHCP scope
Add-DhcpServerv4Scope -Name $ScopeName -StartRange $StartRange -EndRange $EndRange -SubnetMask $SubnetMask

# Set router (default gateway) for the scope
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -Router $Router

# Set DNS servers for the scope
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -DNSServer $DNS1,$DNS2

# Display scope information
Get-DhcpServerv4Scope -ScopeId 192.168.30.0 | Format-List
