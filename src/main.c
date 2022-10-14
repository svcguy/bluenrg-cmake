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
#include "main.h"

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
  if(SystemInit(SYSCLK_64M, RADIO_SYSCLK_NONE) != SUCCESS)
  {
    Error_Handler();
  }

  NVIC_SetPriority(SysTick_IRQn, IRQ_HIGH_PRIORITY);
  LL_Init1msTick(SystemCoreClock);

  LL_GPIO_InitTypeDef led = {0};

  led.Pin         = LL_GPIO_PIN_8;
  led.Mode        = LL_GPIO_MODE_OUTPUT;
  led.Speed       = LL_GPIO_SPEED_FREQ_LOW;
  led.OutputType  = LL_GPIO_OUTPUT_PUSHPULL;
  led.Pull        = LL_GPIO_PULL_NO;
  
  if(LL_GPIO_Init(GPIOB, &led) != SUCCESS)
  {
    Error_Handler();
  }

  while(1)
  {
    LL_GPIO_TogglePin(GPIOB, LL_GPIO_PIN_8);
    LL_mDelay(500);
  }
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  __BKPT(0);

  while(1) 
  {
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
