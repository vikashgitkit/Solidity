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

  useEffect(() => {
    const getTokens = async() => {
      const {data} = await client.query(query).toPromise();
      console.log("Data is:", data);
      setTokens(data.factories);
    }
    getTokens();
  },[])
  return (
    <>
      <div>
      Fetching Info from query{
        tokens!==null && tokens.length>0 && tokens.map((token) => {
          return(
            <div>
              <div>{token.id}</div>
              <div>{token.poolCount}</div>
            </div>
          )
        })
      }
      </div>
    </>
  )
}

export default App
