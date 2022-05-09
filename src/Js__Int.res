module Constants = {
  @inline let minValue = -2147483648
  @inline let maxValue = 2147483647
}

@send external toExponential: int => string = "toExponential"
@send external toExponentialWithPrecision: (int, ~digits: int) => string = "toExponential"

@send external toFixed: int => string = "toFixed"
@send external toFixedWithPrecision: (int, ~digits: int) => string = "toFixed"

@send external toPrecision: int => string = "toPrecision"
@send external toPrecisionWithPrecision: (int, ~digits: int) => string = "toPrecision"

@send external toString: int => string = "toString"
@send external toStringWithRadix: (int, ~radix: int) => string = "toString"
@send external toLocaleString: int => string = "toLocaleString"

external toFloat: int => float = "%identity"
external fromFloat: float => int = "%intoffloat"

let fromStringWithRadix: (string, ~radix: int) => option<int> = (x, ~radix) => {
  let maybeInt = Js__Float.parseIntWithRadix(x, ~radix)
  if Js__Float.isNaN(maybeInt) {
    None
  } else {
    Some(fromFloat(maybeInt))
  }
}
let fromString: string => option<int> = fromStringWithRadix(~radix=10)

external mod: (int, int) => int = "%modint"
