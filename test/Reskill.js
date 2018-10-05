const Reskill = artifacts.require('Reskill');

contract('Reskill', (accounts) => {
  let reskill

  beforeEach(async () => {
    reskill = await Reskill.new()
  })

  it('Should have an address for SimpleStore', async () => {
    assert(reskill.address)
  });

  it('Should set a value', async () => {
    const newValue = 1
    const tx = await reskill.set(newValue, {from: accounts[0]})
    assert.equal(tx.logs[0].args._value.toNumber(), newValue)

    const result = await reskill.get.call({from: accounts[1]})
    assert.equal(result[0], newValue)
    assert.equal(result[1], accounts[1])
  })
})
