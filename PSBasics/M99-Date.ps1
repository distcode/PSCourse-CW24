
# formatting datetime
$now = Get-Date

$now

$now.ToShortDateString()
$now.ToLongDateString()

$now.ToShortTimeString()
$now.ToLongTimeString()

$now.tostring('d. M. yyyy g')
# use:
## Day: d, dd, ddd, dddd
## Month: M, MM, MMM, MMMM
## Year: yy, yyyy
## Era: g
##
## Hour: h, hh, H, HH
## Minute: m, mm
## Second: s, ss
## Second fracture: f, up to seven f
## Timezone: z, zz, zzz
## am/pm: tt

# calulation datetime

$xmas = Get-Date -Day 24 -Month 12 -Year 2023
$xmas

$xmas = $xmas.Date
$xmas

$now = (Get-Date).Date

$daystoxmas = $xmas - $now
$daystoxmas

$now.AddDays(21)
$now.AddDays(-14)
