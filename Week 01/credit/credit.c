#include <cs50.h>
#include <stdio.h>

int main(void)
{
    long number = get_long("Number: ");

    int tdigis = 0;
    long temp = number;
    while (temp > 0)
    {
        temp /= 10;
        digits++;
    }

    int sum = 0;
    temp = number;
    while (temp > 0)
    {
        int last = temp % 10;
        sum += last;
        temp /= 10;

        int second_last = temp % 10;
        int product = second_last * 2;
        sum += product / 10 + product % 10;
        temp /= 10;
    }

    long first_two = number;
    while (first_two >= 100)
    {
        first_two /= 10;
    }

    if (sum % 10 != 0)
    {
        printf("INVALID\n");
    }
    else if ((first_two == 34 || first_two == 37) && digits == 15)
    {
        printf("AMEX\n");
    }
    else if (first_two >= 51 && first_two <= 55 && digits == 16)
    {
        printf("MASTERCARD\n");
    }
    else if (first_two / 10 == 4 && (digits == 13 || digits == 16))
    {
        printf("VISA\n");
    }
    else
    {
        printf("INVALID\n");
    }
}
