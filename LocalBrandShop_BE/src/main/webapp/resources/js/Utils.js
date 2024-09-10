function deleteItem(endpoint, id, itemName) {
    if (confirm("Bạn có chắc chắn xóa không ?") === true) {

        fetch(endpoint, {
            method: "delete"
        }).then(res => {
            if (res.status === 204) {
                let d = document.getElementById(`${itemName}-${id}`);
                console.log(d);
                d.style.display = "none";
            }

            return res.text();
        }).then(res => {
            return JSON.parse(res);
        }).then(res => {
            if (res.error) {
                console.log(res.error);
                throw new Error(res.error);
            }
            
            alert("Xóa thành công!");
        }).catch(ex => {
            alert(ex.message);
        });
    }

}