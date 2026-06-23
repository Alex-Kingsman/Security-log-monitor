# SecurityMonitor.ps1

$StartTime = (Get-Date).AddHours(-24)

# События для проверки
$InterestingEvents = @(
    1102,
    4625,
    4720,
    4726,
    4728,
    4732
)

# 👉 ОПИСАНИЯ СОБЫТИЙ
$EventDescriptions = @{
    1102 = "Журнал безопасности очищен"
    4625 = "Неудачная попытка входа"
    4720 = "Создан новый пользователь"
    4726 = "Удален пользователь"
    4728 = "Пользователь добавлен в глобальную группу"
    4732 = "Пользователь добавлен в локальную группу"
}

$Events = Get-WinEvent -FilterHashtable @{
    LogName   = "Security"
    StartTime = $StartTime
    Id        = $InterestingEvents
} -ErrorAction SilentlyContinue

Add-Type -AssemblyName PresentationFramework

if ($Events.Count -eq 0) {
    [System.Windows.MessageBox]::Show(
        "За последние 24 часа подозрительных событий не найдено.",
        "Security Monitor"
    )
}
else {

    $Report = "Обнаружено $($Events.Count) событие(й):`n`n"

    foreach ($Event in $Events) {

        # 👉 получаем описание
        $desc = $EventDescriptions[$Event.Id]

        if (-not $desc) {
            $desc = "Неизвестное событие"
        }

        $Report += "$($Event.TimeCreated)  ID=$($Event.Id)  $desc`n"
    }

    [System.Windows.MessageBox]::Show(
        $Report,
        "Security Alert"
    )

    $Events |
        Select-Object TimeCreated, Id, ProviderName |
        Sort-Object TimeCreated |
        Format-Table -AutoSize
}
