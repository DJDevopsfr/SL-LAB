import React,{useEffect,useState} from 'react';
import{createRoot}from'react-dom/client';
import'./style.css';
function App(){const[t,setT]=useState('loading...');useEffect(()=>{fetch(`${window.ENV?.BACKEND_URL||'http://localhost:3001'}/api/time`).then(r=>r.json()).then(d=>setT(d.time)).catch(()=>setT('backend unavailable'))},[]);return <main><div className="atom">⚛</div><p>Edit <code>src/main.jsx</code> and save to reload.</p><h3>Hello, the time at the server is now {t}</h3><a href="https://react.dev">Learn React</a></main>}createRoot(document.getElementById('root')).render(<App/>);
