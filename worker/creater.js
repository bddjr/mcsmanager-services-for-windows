console.log('creater.js started');

const mode = process.argv[2];
console.log(`mode: ${mode}\n`);

const node_windows = require('node-windows');
const path = require('path');
const fs = require('fs');

function install(svc_dirname){
    if (!['all', svc_dirname].includes(mode)) return;
    const _name = `MCSManager-${svc_dirname}`;
    console.log(_name);

    let can_not_find = false;
    function trypath(name){
        const p = path.join(__dirname, '..','..', svc_dirname, name);
        if (!fs.existsSync(p)){
            console.log(`Error: Can not find "${p}"`);
            can_not_find = true;
        }
        return p;
    }
    const svc_json = {
        name: _name,
        description: _name,
        workingDirectory: trypath(''),
        execPath: trypath('node_app.exe'),
        script: trypath('app.js'),
    }
    if (can_not_find) return;
    console.log(svc_json);

    const svc = new node_windows.Service(svc_json);
    svc.on('install',()=>{
        console.log(`${_name} service on install`);
        if (svc.exists) console.log(`${_name} service install success!`);
        else console.log(`${_name} service install failed. :(`);
    });
    try{
        svc.install();
    } catch (e){
        console.error(e);
    }
}

install('daemon');
install('web');
console.log('-');
