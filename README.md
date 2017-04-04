#### **Piano client-side protocol**

----------

Este protocolo es una definición del esquema que las apilcaciones móviles van a recibir para presentar las diferentes vistas enviadas desde Piano. Piano devolverá a las aplicaciones móviles un `string` de tipo URI con el siguiente formato: `endiwall://<escenario>/?template=<templateKey>`. Cada escenario tendrá varios templates predefinidos que estarán guardados en s3. Tanto las referencias a cada template como sus propiedades estarán predefinidas en un `JSON` global que las aplicaciones cargarán internamente al inicio de la aplicación. El `JSON` global tendrá cuatro objetos (los 4 diferentes escenarios) y cada objeto tendrá **templates**, **actions** y **values**. 

#### 4 Posibles Escenarios:
  1. Show Dialog: 
      - `key = dialog`
  2. Show Registration: 
      - `key = registration`
  3. Show Offers: 
      - `key = offers`
  4. Request Zip Code: 
      - `key = zipcode`

#### Tipos de Campos en el JSON global:

**Template:**
Un **Template** representa el url de referencia en s3 para un template en específico. El valor de un **Template** siempre va a ser un url en forma de `string`. 

**Action:**
Un **Action** representa una acción dentro o fuera de la aplicación. El valor de un **Action** puede variar entre un `deeplink` o un `URL`.

Acciones predefinidas:
  
  1. **style**: string ("overlay" || "inLine" || "deeplink")
  2. **buttons**: string (`<deeplink>`, `<url>`)
  3. **links**: string (`<deeplink>`, `<url>`)

**Value:**
Un **value** representa un valor asignable a un objeto específico dentro de la aplicación. El valor de un **Value** puede variar entre un `string`, `int`, `double` previamente definido para cada **Value**. 

Valores predefinidos:
  
  1. **copy**: string
  2. **bgColor**: string
  3. **fontColor**: string
  4. **buttonColor**: string
  5. **showMeter**: bool
  6. **position**: string ("top" || "bottom")

#### Notas: 
*  **showNewsletterRegistration** va a llegar como un `deeplink` en un **dialog**. 

----------
#### **Posibles escenarios**

**1. Show Dialog:**

**URI:** `endiwall://dialog/template?=t1`

**2. Show Registration:**

**URI:** `endiwall:registration/template?=t3`

**3. Show Offers:**

**URI:** `endiwall:offers//template?=t2`

**4. Request Zip Code:**

**URI:** `endiwall:zipcode//template?=t1`

**JSON:**
    
    
 	dialog: {
      templates: {
        t1: "http://s3.amazonaws.com/bucket/t1",
        t2: "http://s3.amazonaws.com/bucket/t2",
        t3: "http://s3.amazonaws.com/bucket/t3",
        ...
      },
      actions: {  
        t1: {
          style: string,
          button: string,
          links: [string]
        }...
      },
      values: {
        t1: {
          copy: string,
          bgColor: string, 
          fontColor: string, 
          btBgColor: string,
          btTextColor: string, 
          showMeter: bool, 
          position: string
        }... 
      }
    }, 
    registration: { 
      templates: {
        t1: "http://s3.amazonaws.com/bucket/t1",
        t2: "http://s3.amazonaws.com/bucket/t2",
        t3: "http://s3.amazonaws.com/bucket/t3",
        ...
      }
      actions: {
        t1: {
          style: string, 
          button: string,
          links: [string]
        }...
      }, 
      values: {
        t1: {
          copy: string, 
          imageURLs: [string],
          bgColor: string, 
          fontColor: string, 
          btBgColor: string,
          btTextColor: string, 
        }...
      } 
    },
    offers: { 
      templates: {
        t1: "http://s3.amazonaws.com/bucket/t1",
        t2: "http://s3.amazonaws.com/bucket/t2",
        t3: "http://s3.amazonaws.com/bucket/t3",
        ...
      },
      actions: {
        t1: {
          style: string,
          button: string,
          links: [string]
        }...
      },
      values: {
        t1: {
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
    },
    zipcode: { 
      templates: {
        t1: "http://s3.amazonaws.com/bucket/t1",
        t2: "http://s3.amazonaws.com/bucket/t2",
        t3: "http://s3.amazonaws.com/bucket/t3",
        ...
      },
      actions: {
        t1: {
          style: string
          button: string,
        }...
      },
      values: {
        t1: {
          copy: string, 
          imageURLs: [string], 
          bgColor: string, 
          fontColor: string, 
          btBgColor: string,
          btTextColor: string
        }...
      }
    }
