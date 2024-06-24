import React, { useEffect } from 'react'
import { MainPage } from './pages/MainPage'
import Sidebar from './Components/Sidebar'
import Home from './pages/Home'
import ParticularMusic from './Components/ParticularMusic'
import { BrowserRouter,Routes,Route } from 'react-router-dom'
import Register from './Components/Register'
const App=()=> {
  return (
	<BrowserRouter>
			<Routes>
				<Route path='/register' element={<Register />} /> 
				{/* <Route path='/home' element={<Home />} /> */}
			</Routes>
			<div className='flex bg-black h-screen p-[15px] gap-[0.5rem] overflow-hidden'>
				<Sidebar />
				<Routes>
                <Route path='/' element={<MainPage />} />
				<Route path='/album/:id' element={<ParticularMusic />} />
				</Routes>
	</div>
	</BrowserRouter>
  )
}

export default App