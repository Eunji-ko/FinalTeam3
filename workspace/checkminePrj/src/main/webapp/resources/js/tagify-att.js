
var usersList = [ //이부분에 data를 넣어서 70열의 whitelist에 넣고 싶어요.
{ "value": 1, "name": 'Emma Smith', "deptNo": '인사부', "posNo" : '사원'},
{ value: 2, name: 'Max Smith', email: 'max@kt.com'},
{ value: 3, name: 'Sean Bean', email: 'sean@dellito.com'},
{ value: 4, name: 'Brian Cox', email: 'brian@exchange.com'},
{ value: 5, name: 'Francis Mitcham', email: 'f.mitcham@kpmg.com.au'},
{ value: 6, name: 'Dan Wilson', email: 'dam@consilting.com'},
{ value: 7, name: 'Ana Crown', email: 'ana.cf@limtel.com'},
{ value: 8, name: 'John Miller', email: 'miller@mapple.com'},
];


$(function(){ //데이터 가져온 코드
    $.ajax({
        url : "write/attList",
        method:"GET",
        success:function(att){
                usersList = att;
                tag(usersList);
        }
    })
});

function tag(usersList){

    var inputElm = document.querySelector('#att');

        function tagTemplate(tagData) {
            return `
                <tag title="${(tagData.title || tagData.deptNo || tagData.posNo)}"
                        contenteditable='false'
                        spellcheck='false'
                        tabIndex="-1"
                        class="${this.settings.classNames.tag} ${tagData.class ? tagData.class : ""}"
                        ${this.getAttributes(tagData)}>
                    <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
                    <div class="d-flex align-items-center">
                        <div class='tagify__tag__avatar-wrap ps-0'>
                        </div>
                        <span class='tagify__tag-text'>${tagData.name}</span>
                    </div>
                </tag>
            `
        }
        
        function suggestionItemTemplate(tagData) {
            return `
                <div ${this.getAttributes(tagData)}
                    class='tagify__dropdown__item d-flex align-items-center ${tagData.class ? tagData.class : ""}'
                    tabindex="0"
                    role="option">
                    <div class="d-flex flex-column">
                        <strong>${tagData.name}</strong>
                        <span>${tagData.deptNo} | ${tagData.posNo}</span>
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
            whitelist: usersList,
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
                deptNo: tagify.settings.whitelist.reduce(function (remainingSuggestions, item) {
                    return tagify.isTagDuplicate(item.value) ? remainingSuggestions : remainingSuggestions + 1
                }, 0) + " Members"
            }]
            )
        }
        
}