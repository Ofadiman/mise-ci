import { test, expect } from 'vitest'
import { server } from './main'

test('should return status', async () => {
  const response = await server.inject({
    method: 'GET',
    url: '/health',
  })

  expect(response.body).toEqual('{"status":"ok"}')
})
