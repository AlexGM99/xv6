# xv6_ASO
xv6 operative system with some extra functions implemented: 
  - SYSCALL date -> give the date in format year-month-day hour:minute:sec 
  - SYSCALL dup2 -> As linux
  - Deferred page space allocation (reserva diferida)
  - Lazy page allocation
  - Big files based on inodes of: 11 directs blocks, 1 BSI and 1 BDI -> 512B of block size - arch i32
  - Remove big files (that ones that uses the BDI) properly
  - Bigger file system (50.000 Blocks)
  TO BE CONTINUED
  
Alejandro García Martínez
Eduardo Pérez Martínez
