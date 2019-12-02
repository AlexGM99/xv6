#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  char* a = sbrk (15000);

  a[500] = 1;

  if ((uint)a + 15000 != (uint) sbrk (-15000))
  {
    printf (1, "sbrk() con número positivo falló.\n");
    exit();
  }

  if (a != sbrk (0))
  {
    printf (1, "sbrk() con cero falló.\n");
    exit();
  }

  if (a != sbrk (15000))
  {
    printf (1, "sbrk() negativo falló.\n");
    exit();
  }

  printf (1, "Debe imprimir 1: %d.\n", ++a[500]);

  exit();
}
