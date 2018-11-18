<list>

    <style>
        li {
            list-style-type: none;
        }
    </style>
    <div>
        <ul>
            <h3 style="text-align: center;">Список заданий</h3>
            <li if="{tasks}" each="{header, i in tasks}">
                <button id = "choose" style="background-color: #80D4DF; border-color: #0ec3db"
                        class="btn btn-sm btn-block" data-message="{header}"
                        onclick="{choose}" value = "{header}">{header}</button>
            </li>
        </ul>
    </div>

    <script>
        this.update();
        this.on('update', (e) => {
            if(e == null) {
            this.tasks = []
            this.flag = this.parent.flag
            jQuery.get(this.flag).done(function (data) {
                this.tasks = []
                $.each(
                    data.tasks,
                    function (intIndex, objValue) {
                        this.tasks.push(objValue);
                    }.bind(this))
                this.update({first: false})
            }.bind(this))
        }
        })

        choose(e) {
            this.parent.update({events : "get", header: e.target.dataset.message, flag: this.flag})
        }
    </script>
</list>