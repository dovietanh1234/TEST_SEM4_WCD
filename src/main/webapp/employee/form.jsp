<html>
<head>
    <title>Students</title>
</head>
<body>
<div class="container">
    <h1>Add Student Demo</h1>
    <!--  Table students -->
    <div class="row">
        <div class="col-6">
            <form method="post" action="create-student">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">employee_id</label>
                    <input type="text" name="employee_id" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">name</label>
                    <input type="text" name="name" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">phone_number</label>
                    <input type="text" name="phone_number" class="form-control" aria-describedby="emailHelp"/>
                </div>
                <div class="mb-3">

                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>