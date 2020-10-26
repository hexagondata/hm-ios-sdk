# Hexagon  Data iOS SDK

This project contains Hexagon Match Platform iOS SDK to be provided to clients to want implement our pixel into their iOS mobile apps.

## Integrating the Hexagon Data SDK

Add the library as a Package dependency:





### Import the SDK

```SWIFT
import hexagonmatch_sdk
```

### Creating instance

Instance to Hexagon Data SDK can be created anywhere as required. 


```SWIFT
    let hmmanager = hexagonmatch_sdk(platformId: "1", tagId: "4001", clientId: "LAX")
```

The `hexagonmatch_sdk` object accepts the following params:

* clientId of  Hexagon Match Platform provided by Hexagon Data
* String tagId - provided by Hexagon Data.
* String Platform - provided by Hexagon Data


### Passing a value

```SWIFT
hmmanager.SendData(keyValue: "email@gmail.com", keyType: "email")
```

### Complete Example
```
import SwiftUI
import hexagonmatch_sdk

struct ContentView: View {
    
    @State private var message = "Escribe tu correo"
    @State private var textStyle = UIFont.TextStyle.body
    
    var hm = hexagonmatch_sdk(platformId: "2", tagId: "7989", clientId: "amex")
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextView(text: $message, textStyle: $textStyle)
                .padding(.horizontal)
            
            Button(action: {
                
                hm.SendData(keyValue:"235kiet", keyType: "customer")
                
                self.textStyle = (self.textStyle == .body) ? .title1 : .body
            }) {
                Image(systemName: "textformat")
                    .imageScale(.large)
                    .frame(width: 80, height: 60)
                    .foregroundColor(.white)
                    .background(Color.purple)
                    
                
            }
            .padding()    
        }
    }
}
```
Call the function in the place that you consider the correct.
