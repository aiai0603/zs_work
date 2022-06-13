import {
  getType
} from './utils.js'

export default function parser (param) {
  switch (getType(param)) {
    case 'array':
      return param.map(item => parser(item))
    case 'object':
      Object.keys(param).forEach(key => {
        param[key] = parser(param[key])
      })
      return param
    case 'regexp':
      return {
        $regexp: {
          source: param.source,
          flags: param.flags
        }
      }
    case 'date':
      return {
        $date: param.toISOString()
      }
    default:
      return param
  }
}
