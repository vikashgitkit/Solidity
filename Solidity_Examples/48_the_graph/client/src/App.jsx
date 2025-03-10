import { useState, useEffect } from 'react'
import './App.css'
import {createClient} from 'urql';

function App() {
  const [tokens, setTokens] = useState([]);

  const queryUrl = "https://gateway.thegraph.com/api/94d2b9f620df1630edfa50b53f323b07/subgraphs/id/HUZDsRpEVP2AvzDCyzDHtdc64dyDxx8FQjzsmqSg4H3B";
  const query = `{
  factories(first: 5) {
    id
    poolCount
    txCount
    totalVolumeUSD
  }
}`

  const client = createClient({
    url: queryUrl
  })

 
  return (
    <>
      <div>
      </div>
    </>
  )
}

export default App
