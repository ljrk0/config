'use strict';

const Main = imports.ui.main;
const DateMenu = Main.panel.statusArea.dateMenu

class RemoveWorldClocks {
    constructor() {
    }

    enable() {
    DateMenu._clocksItem.hide();
    }

    disable() {
    DateMenu._clocksItem.show();
    }
}

function init() {
    return new RemoveWorldClocks();
}
