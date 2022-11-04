// https://www.mockaroo.com/


var inputElm = document.querySelector('input[name=attNoR]');

function tagTemplate(tagData){
    return `
        <tag title="${tagData.email}"
                contenteditable='false'
                spellcheck='false'
                tabIndex="-1"
                class="tagify__tag ${tagData.class ? tagData.class : ""}"
                ${this.getAttributes(tagData)}>
            <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
            <div>
                <div class='tagify__tag__avatar-wrap'>
                    <img onerror="this.style.visibility='hidden'" src="${tagData.avatar}">
                </div>
                <span class='tagify__tag-text'>${tagData.name}</span>
            </div>
        </tag>
    `
}

function suggestionItemTemplate(tagData){
    return `
        <div ${this.getAttributes(tagData)}
            class='tagify__dropdown__item ${tagData.class ? tagData.class : ""}'
            tabindex="0"
            role="option">
            ${ tagData.avatar ? `
                <div class='tagify__dropdown__item__avatar-wrap'>
                    <img onerror="this.style.visibility='hidden'" src="${tagData.avatar}">
                </div>` : ''
            }
            <strong>${tagData.name}</strong>
            <span>${tagData.email}</span>
        </div>
    `
}

function dropdownHeaderTemplate(suggestions){
    return `
        <header data-selector='tagify-suggestions-header' class="${this.settings.classNames.dropdownItem} ${this.settings.classNames.dropdownItem}__addAll">
            <div>
                <strong>${this.value.length ? `Add Remaning` : 'Add All'}</strong>
                <a class='remove-all-tags'>Remove all</a>
            </div>
            <span>${suggestions.length} members</span>
        </header>
    `
}

// initialize Tagify on the above input node reference
var tagify = new Tagify(inputElm, {
    tagTextProp: 'name', // very important since a custom template is used with this property as text
    // enforceWhitelist: true,
    skipInvalid: true, // do not remporarily add invalid tags
    dropdown: {
        closeOnSelect: false,
        enabled: 0,
        classname: 'users-list',
        searchKeys: ['name', 'email']  // very important to set by which keys to search for suggesttions when typing
    },
    templates: {
        tag: tagTemplate,
        dropdownItem: suggestionItemTemplate,
        dropdownHeader: dropdownHeaderTemplate
    },
    whitelist: [
        {
            "value": 1,
            "name": "테스트",
            "email": "jhattersley0@ucsd.edu",
            "team": "A"
        },
    ],

    transformTag: (tagData, originalData) => {
        var {name, email} = parseFullValue(tagData.name)
        tagData.name = name
        tagData.email = email || tagData.email
    },

    validate({name, email}) {
        // when editing a tag, there will only be the "name" property which contains name + email (see 'transformTag' above)
        if( !email && name ) {
            var parsed = parseFullValue(name)
            name = parsed.name
            email = parsed.email
        }

        if( !name ) return "Missing name"
        if( !validateEmail(email) ) return "Invalid email"

        return true
    }
})

function escapeHTML( s ){
    return typeof s == 'string' ? s
        .replace(/&/g, "&")
        .replace(/</g, "<")
        .replace(/>/g, ">")
        .replace(/"/g, '"')
        .replace(/`|'/g, "'")
        : s;
}

// The below part is only if you want to split the users into groups, when rendering the suggestions list dropdown:
// (since each user also has a 'team' property)
tagify.dropdown.createListHTML = sugegstionsList  => {
    const teamsOfUsers = sugegstionsList.reduce((acc, suggestion) => {
        const team = suggestion.team || 'Not Assigned';

        if( !acc[team] )
            acc[team] = [suggestion]
        else
            acc[team].push(suggestion)

        return acc
    }, {})

    const getUsersSuggestionsHTML = teamUsers => teamUsers.map((suggestion, idx) => {
        if( typeof suggestion == 'string' || typeof suggestion == 'number' )
            suggestion = {value:suggestion}

        var value = tagify.dropdown.getMappedValue.call(tagify, suggestion)

        suggestion.value = value && typeof value == 'string' ? escapeHTML(value) : value

        return tagify.settings.templates.dropdownItem.apply(tagify, [suggestion]);
    }).join("")


    // assign the user to a group
    return Object.entries(teamsOfUsers).map(([team, teamUsers]) => {
        return `<div class="tagify__dropdown__itemsGroup" data-title="Team ${team}:">${getUsersSuggestionsHTML(teamUsers)}</div>`
    }).join("")
}

// attach events listeners
tagify.on('dropdown:select', onSelectSuggestion) // allows selecting all the suggested (whitelist) items
      .on('edit:start', onEditStart)  // show custom text in the tag while in edit-mode

function onSelectSuggestion(e){
    if( e.detail.event.target.matches('.remove-all-tags')) {
        tagify.removeAllTags()
    }

    // custom class from "dropdownHeaderTemplate"
    else if( e.detail.elm.classList.contains(`${tagify.settings.classNames.dropdownItem}__addAll`) )
        tagify.dropdown.selectAll();
}

function onEditStart({detail:{tag, data}}){
    tagify.setTagTextNode(tag, `${data.name} <${data.email}>`)
}

// https://stackoverflow.com/a/9204568/104380
function validateEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

function parseFullValue(value) {
    // https://stackoverflow.com/a/11592042/104380
    var parts = value.split(/<(.*?)>/g),
        name = parts[0].trim(),
        email = parts[1]?.replace(/<(.*?)>/g, '').trim();

    return {name, email}
}