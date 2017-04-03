#### **Piano client-side protocol**

----------

#### 4 Posibles Escenarios:
1. Show Dialog 
2. Show Registration
3. Show Offers
4. Request Zip Code

#### Tipos de Campos:

**Action:**
Un **Action** representa una acción dentro o fuera de la aplicación. El valor de un **Action** puede variar entre un **deeplink** o un **URL**.

Acciones predefinidas:

  1. **close**: "dismiss" o "back"
	2. **buttons**: `"deeplink: <deeplink>"`, `"url: <url>"`
	3. **links**: `"deeplink: <deeplink>"`, `"url: <url>"`
	4. **presentationType**: "overlay", "inLine" o "deeplink"

**Value:**
Un **value** representa un valor asignable a un objeto específico dentro de la aplicación. El valor de un **Value** puede varias entre un **string**, **int**, **double** previamente definido para cada **Value**. 

Valores predefinidos:

  1. **copy**: string
	2. **bgColor**: string
	3. **fontColor**: string
	4. **buttonColor**: string
	5. **showMeter**: bool
	6. **position**: {**top**: double, **bottom**: double}

#### Notas: 
*  **showNewsletterRegistration** va a llegar como un *deeplink* en un **dialog**. 

----------
#### **Posibles escenarios**

**1. Show Dialog:**

**URI:** `endiwall://dialog/actions?=a1&values=v3`

**JSON:**

    
	dialog: {
    actions: {  
      a1: {
        close: string, 
        button: string,
        links: [string],
        presentationType: string
      }...
    },
    values: {
      v1: {
        copy: string,
        bgColor: string, 
        fontColor: string, 
        btBgColor: string,
        btTextColor: string, 
        showMeter: bool, 
        position: {
          top: double,
          bottom: double
        }...
     }
    }
  }

**2. Show Registration:**

**URI:** `endiwall:registration/actions?=a1&values=v3`

**JSON:**

    registration: { 
      actions: {
        a1: {
          close: string, 
          button: string,
          links: [string],
          presentationType: string
        }...
      }, 
      values: {
        v3: {
          copy: string, 
          imageURLs: [string],
          bgColor: string, 
          fontColor: string, 
          btBgColor: string,
          btTextColor: string, 
        }...
      }
    }

**3. Show Offers:**
**URI:** `endiwall:offers//actions?=a1&values=v3`
**JSON:**

    offers: { 
      actions: {
        a1: {
          close: string, 
          button: string,
          links: [string],
          presentationType: string
        }...
      },
      values: {
        v1: {
          copy: string, 
          imageURLs: [string],
          bgColor: string, 
          fontColor: string, 
          btBgColor: string,
          btTextColor: string, 
          offers: {
            inAppDescr: string,
            inAppID: string
          }
        }...
      }
    } 

**4. Request Zip Code:**

**URI:** `endiwall:zipcodeReq//actions?=a1&values=v3`

**JSON:**

    zipcodeReq: { 
      actions: {
        a1: {
          close: string, 
          button: string,
          presentationType: string
        }...
      },
      values: {
        v1: {
          copy: string, 
          imageURLs: [string], 
          bgColor: string, 
          fontColor: string, 
          btBgColor: string,
          btTextColor: string
        }...
      }
    }

