import React from 'react'
import {useState} from 'react'
import axios from 'axios'
import { useNavigate } from 'react-router-dom'
const Register = () => {
   const [fname,setfName] = useState('')
   const [lname,setlName] = useState('')
   const [email,setEmail] = useState('')
   const [number,setNumber] = useState('')
   const [address,setAddress] = useState('')
   const navigate=useNavigate()
   const handleSubmit = () =>{
    if(fname=='' || lname=='' || email=='' || number == '' || address == '' ){
        navigate('/register')
    }
    if(fname==localStorage.getItem('firstname')){
       alert("The user is exists");
    }
    else{

    // axios.post('http://localhost:8080/register',{
    //     firstname:fname,
    //     lastname:lname,
    //     email:email,
    //     phonenumber:number,
    //     address:address
    // })
    localStorage.setItem('firstname',fname)
    localStorage.setItem('lastname',lname)
    localStorage.setItem('email',email)
    localStorage.setItem('number',number)
    localStorage.setItem('address',address)
    setfName('')
    setlName('')
    setEmail('')
    setNumber('')
    setAddress('')
    navigate('/')
}
   }
  return (
    <div className=' flex  flex-col justify-center gap-[3rem] items-center w-[100%] bg-black h-screen'>
        <div>
            <h1 className='text-[70px] font-bold w-[500px] text-center'>Sign Up to start <span className='text-[#35b04e]'>Listening</span> </h1>
        </div>
        <div className='flex flex-col gap-[2rem] w-[100%] items-center'>
            <div className='flex gap-[2rem] border]'>
        <div className='flex flex-col gap-[1rem] '>
            <label htmlFor="" className='font-bold'>First Name</label>
            <input type="text" name="name" id="" className='border h-[40px] text-[black] w-[250px] pl-[5px] rounded-md focus:outline-none' value={fname} onChange={(e)=>setfName(e.target.value)} required/>
        </div>
        <div className='flex flex-col gap-[1rem] '>
            <label htmlFor="" className='font-bold'>Sur Name</label>
            <input type="text" name="name" id="" className='border h-[40px] text-[black] w-[250px] pl-[5px] rounded-md focus:outline-none' value={lname} onChange={(e)=>setlName(e.target.value)} required/>
        </div>
        </div>
        <div className='flex flex-col gap-[1rem] '> 
            <label htmlFor="" className='font-bold'>Email Address</label>
            <input type="text" name="name" id="" className='border h-[40px] text-[black] w-[530px] pl-[5px] rounded-md focus:outline-none' value={email} onChange={(e)=>setEmail(e.target.value)} required />
        </div>
        <div className='flex flex-col gap-[1rem] '>
            <label htmlFor="" className='font-bold'>Phone Number</label>
            <input type="text" name="name" id="" className='border h-[40px] text-[black] w-[530px] pl-[5px] rounded-md focus:outline-none' value={number} onChange={(e)=>setNumber(e.target.value)} required />
        </div>
        <div className='flex flex-col gap-[1rem] '>
            <label htmlFor="" className='font-bold'>Address</label>
            <input type="text" name="name" id="" className='border h-[40px] text-[black] w-[530px] pl-[5px] rounded-md focus:outline-none' value={address} onChange={(e)=>setAddress(e.target.value)} required/>
        </div>
        </div>
        <button className='bg-[#35b04e] w-[250px] py-[10px] rounded-full font-bold cursor-pointer' onClick={handleSubmit}>Sign Up</button>
    </div>
  )
}

export default Register