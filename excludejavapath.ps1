$paths = @(
    "C:\Program Files\Common Files\Oracle\Java\javapath",
    "C:\Program Files (x86)\Common Files\Oracle\Java\javapath",
    "C:\ProgramData\Oracle\Java\javapath",
    "C:\Program Files\Common Files\Oracle\Java\java8path",
    "C:\Program Files (x86)\Common Files\Oracle\Java\java8path"
)

$syspath = $env:PATH -split ";"

# Filtra os caminhos que não estão na lista de caminhos a serem removidos
$filteredPaths = $syspath | Where-Object { $path = $_; -not ($paths -contains $path) }

# Junta os caminhos restantes em uma única string
$newPath = $filteredPaths -join ";"

# Atualiza a variável de ambiente PATH do sistema
[System.Environment]::SetEnvironmentVariable("PATH", $newPath, [System.EnvironmentVariableTarget]::Machine)


