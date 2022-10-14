/**
 * @file        rf_device_it.c
 * @author      svcguy
 * @brief 
 * @version     0.1
 * @date        2022-10-13
 * 
 * @copyright   Copyright (c) 2022
 * 
 */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "rf_device_it.h"

/* Private includes ----------------------------------------------------------*/
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private user code ---------------------------------------------------------*/
/* External variables --------------------------------------------------------*/


/******************************************************************************/
/*           Cortex Processor Interruption and Exception Handlers          */ 
/******************************************************************************/

/**
  * @brief This function handles Hard fault interrupt.
  */
void HardFault_IRQHandler(void)
{
  while (1)
  {
  }
}

/**
  * @brief This function handles System tick timer.
  */
void SysTick_IRQHandler(void)
{

}

/******************************************************************************/
/* Peripheral Interrupt Handlers                                              */
/* Add here the Interrupt Handlers for the used peripherals.                  */
/* For the available peripheral interrupt handler names,                      */
/* please refer to the startup file.                                          */
/******************************************************************************/


/*****END OF FILE****/
