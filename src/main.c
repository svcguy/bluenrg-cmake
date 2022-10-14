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

  if(HAL_Init() != HAL_OK)
  {
    Error_Handler();
  }

  GPIO_InitTypeDef led = {0};

  led.Pin     = GPIO_PIN_6;
  led.Mode    = GPIO_MODE_OUTPUT_PP;
  led.Speed   = GPIO_SPEED_FREQ_LOW;
  led.Pull    = GPIO_NOPULL;

  HAL_GPIO_Init(GPIOA, &led);

  while(1)
  {
    HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_6);
    HAL_Delay(500);
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
