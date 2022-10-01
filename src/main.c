/**
 * @file    main.c
 * @author  svcguy
 * @brief   Template project for the BlueNRG-2 device
 * @version 0.1
 * @date    2022-09-23
 * 
 * @copyright Copyright (c) 2022
 * 
 */

/* Includes ------------------------------------------------------------------*/
#include "bluenrg_x_device.h"
#include "BlueNRG1_conf.h"
#include "clock.h"
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/  
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
int main(void)
{
  SystemInit();
  Clock_Init();

  SysCtrl_PeripheralClockCmd(CLOCK_PERIPH_GPIO, ENABLE);

  GPIO_InitType led;
  led.GPIO_Mode = GPIO_Output;
  led.GPIO_Pull = DISABLE;
  led.GPIO_HighPwr = DISABLE;
  led.GPIO_Pin = GPIO_Pin_14;
  GPIO_Init(&led);
  
  while(1)
  {
    GPIO_ToggleBits(GPIO_Pin_14);
    Clock_Wait(500);
  }
}

#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* Infinite loop */
  while (1)
  {

  }
}
#endif

/*** EOF ***/
