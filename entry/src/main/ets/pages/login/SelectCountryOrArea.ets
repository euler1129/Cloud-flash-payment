/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-22 15:20
 */
import { CountryOrAreaList } from 'mylibrary/src/main/ets/components/countryorarea/CountryOrAreaList'



@Entry
@Component
struct SelectCountryOrArea {
  build() {
    Column() {
      CountryOrAreaList({ goBackTargetUrl: 'pages/login/LoginIndex' })
    }
  }
}