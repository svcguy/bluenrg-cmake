/**
 * @file      rf_device_it.h
 * @author    svcguy
 * @brief 
 * @version   0.1
 * @date      2022-10-13
 * 
 * @copyright Copyright (c) 2022
 * 
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __RF_DEVICE_IT_H
#define __RF_DEVICE_IT_H

#ifdef __cplusplus
 extern "C" {
#endif 

/* Private includes ----------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported functions prototypes ---------------------------------------------*/
void HardFault_IRQHandler(void);
void SysTick_IRQHandler(void);

/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/

#ifdef __cplusplus
}
#endif

#endif /* __RF_DEVICE_IT_H */

/*****END OF FILE****/
