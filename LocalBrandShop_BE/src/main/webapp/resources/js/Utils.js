function deleteItem(endpoint, id, itemName) {
    if (confirm("Bạn có chắc chắn xóa không... ?") === true) {

        fetch(endpoint, {
            method: "delete"
        }).then(res => {
            if (res.status === 204) {
                let d = document.getElementById(`${itemName}-${id}`);
                d.style.display = "none";
            } else {
                alert("Something Wrong!");
            }

        });
    }

}