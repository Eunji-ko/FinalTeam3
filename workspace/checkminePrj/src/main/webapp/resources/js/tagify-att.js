var inputElm = document.querySelector('#att');

var data = "";

$(function(){ //데이터 가져온 코드
    $.ajax({
        url : "write/attList",
        method:"GET",
        success:function(att){
            $.each(att, function(idx, val) {
                console.log(idx + " " + val.name + " / ");
                data += idx + " " + val.name + " / ";
                ~~~
            });
        }
    }).then(function(){
        console.log("then > data : " + data);
        
    });
});

event ~~~ {
    data. ~~~
}



const usersList = [ //이부분에 data를 넣어서 70열의 whitelist에 넣고 싶어요.
    { value: 1, name: 'Emma Smith', deptNo: '인사부'},
    { value: 2, name: 'Max Smith', avatar: 'avatars/300-1.jpg', email: 'max@kt.com' },
    { value: 3, name: 'Sean Bean', avatar: 'avatars/300-5.jpg', email: 'sean@dellito.com' },
    { value: 4, name: 'Brian Cox', avatar: 'avatars/300-25.jpg', email: 'brian@exchange.com' },
    { value: 5, name: 'Francis Mitcham', avatar: 'avatars/300-9.jpg', email: 'f.mitcham@kpmg.com.au' },
    { value: 6, name: 'Dan Wilson', avatar: 'avatars/300-23.jpg', email: 'dam@consilting.com' },
    { value: 7, name: 'Ana Crown', avatar: 'avatars/300-12.jpg', email: 'ana.cf@limtel.com' },
    { value: 8, name: 'John Miller', avatar: 'avatars/300-13.jpg', email: 'miller@mapple.com' },
    data
];

function tagTemplate(data) {
    return `
        <tag title="${(data.name || data.deptNo)}"
                contenteditable='false'
                spellcheck='false'
                tabIndex="-1"
                class="${this.settings.classNames.tag} ${data.class ? data.class : ""}"
                ${this.getAttributes(data)}>
            <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
        </tag>
    `
}

function suggestionItemTemplate(data) {
    return `
        <div ${this.getAttributes(data)}
            class='tagify__dropdown__item d-flex align-items-center ${data.class ? data.class : ""}'
            tabindex="0"
            role="option">

            <div class="d-flex flex-column">
                <strong>${data.name}</strong>
                <span>${data.deptNo}</span>
            </div>
        </div>
    `
}

// initialize Tagify on the above input node reference
var tagify = new Tagify(inputElm, {
    tagTextProp: 'name', // very important since a custom template is used with this property as text. allows typing a "value" or a "name" to match input with whitelist
    enforceWhitelist: true,
    skipInvalid: true, // do not remporarily add invalid tags
    dropdown: {
        closeOnSelect: false,
        enabled: 0,
        classname: 'users-list',
        searchKeys: ['name', 'deptNo']  // very important to set by which keys to search for suggesttions when typing
    },
    templates: {
        tag: tagTemplate,
        dropdownItem: suggestionItemTemplate
    },
    whitelist: usersList
    //여기에 usersList를 callback? promise?를 이용해서 만든 함수명을 넣으면 되는 걸까요?
})

tagify.on('dropdown:show dropdown:updated', onDropdownShow)
tagify.on('dropdown:select', onSelectSuggestion)

var addAllSuggestionsElm;

function onDropdownShow(e) {
    var dropdownContentElm = e.detail.tagify.DOM.dropdown.content;

    if (tagify.suggestedListItems.length > 1) {
        addAllSuggestionsElm = getAddAllSuggestionsElm();

        // insert "addAllSuggestionsElm" as the first element in the suggestions list
        dropdownContentElm.insertBefore(addAllSuggestionsElm, dropdownContentElm.firstChild)
    }
}

function onSelectSuggestion(e) {
    if (e.detail.elm == addAllSuggestionsElm)
        tagify.dropdown.selectAll.call(tagify);
}

// create a "add all" custom suggestion element every time the dropdown changes
function getAddAllSuggestionsElm() {
    // suggestions items should be based on "dropdownItem" template
    return tagify.parseTemplate('dropdownItem', [{
        class: "addAll",
        name: "Add all",
        email: tagify.settings.whitelist.reduce(function (remainingSuggestions, item) {
            return tagify.isTagDuplicate(item.value) ? remainingSuggestions : remainingSuggestions + 1
        }, 0) + " Members"
    }]
    )
}