# Error:

![1](https://github.com/byndit/Debug-JIT-Error/assets/3731681/17562a3e-891e-4009-aed7-b037ea1e9b75)

# Used Version:

![2](https://github.com/byndit/Debug-JIT-Error/assets/3731681/597cc94d-53a7-46f3-ba5f-343a29c88d59)

Test Page Information:
- Test Page 1: 
  - OnAfterGetRecord -> Rec.CalcFields -> Error
- Test Page 2: 
  - OnAfterGetRecord -> NewRec = Rec -> NewRec.CalcFields -> No Error
- Test Page 3: 
  - SelectLatestVersion in OnAction trigger -> OnAfterGetRecord -> Rec.CalcFields -> No Error
- Test Page 4: 
  - Blob Field shown on the Page ->  OnAfterGetRecord -> Rec.CalcFields -> No Error
- Test Page 5: 
  - Blob Field hidden on the Page ->  OnAfterGetRecord -> Rec.CalcFields -> No Error

# First Test:
To reproduce the error in the first test page 62001: 
-	Open the page
-	Add some entries as shown: ![3](https://github.com/byndit/Debug-JIT-Error/assets/3731681/714cb2c0-c9a6-491c-91e0-4a6bfeb23b6b)
-	Mark the second or third entry
-	Click on “Run Action” (two times) 
o	First time: Test Bool will be switched to “true”
o	Second time: Error

# Second Test:
To reproduce the error in the first test page 62001: 
-	Reopen the page after you got the error.
-	The second entry (if selected before) has Test Bool set to true now: ![4](https://github.com/byndit/Debug-JIT-Error/assets/3731681/35150b78-cf6b-4fd4-b6ac-2364f6ffdcfc)
-	Mark the second entry
-	Click on “Run Action” (the error will come up directly and the page will be closed; then you can’t start the page again until you clean your cache)
