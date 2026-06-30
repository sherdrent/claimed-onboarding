import { useState, useEffect } from 'react'
import './App.css'

import BrandsCircle from './BrandsCircle'
import claimLogo from './assets/claimed-logo.svg'
import unclaimedFolder from './assets/unclaimed-folder-new.png'
import settlementCards from './assets/settlement-cards.png'
import claimTracker from './assets/claim-tracker-new.png'
import phoneNotifications from './assets/phone-notifications-new.png'
import settlementUnclaimed from './assets/settlement-unclaimed.png'
import brandsGlow from './assets/brands-glow.png'

import instagramIcon from './assets/instagram-icon.png'
import instagramLogo from './assets/instagram-logo.png'
import yahooIcon from './assets/yahoo-icon.png'
import yahooLogo from './assets/yahoo-logo.png'
import juulIcon from './assets/juul-icon.png'
import juulLogo from './assets/juul-logo.png'
import appleIcon from './assets/apple-icon.png'
import appleLogo from './assets/apple-logo.png'
import bumbleIcon from './assets/bumble-icon.png'
import bumbleLogo from './assets/bumble-logo.png'
import plaidIcon from './assets/plaid-icon.png'
import plaidLogo from './assets/plaid-logo.png'
import ebayIcon from './assets/ebay-icon.png'
import ebayLogo from './assets/ebay-logo.png'
import airbnbIcon from './assets/airbnb-icon.png'
import airbnbLogo from './assets/airbnb-logo.png'
import visaMcIcon from './assets/visa-mc-icon.png'
import visaMcLogo from './assets/visa-mc-logo.png'

import tiktokImg from './assets/tiktok.png'
import floImg from './assets/flo.png'
import spotifyImg from './assets/spotify.png'
import fortniteImg from './assets/fortnite.png'
import kirklandImg from './assets/kirkland.png'
import grubhubImg from './assets/grubhub.png'
import tinderImg from './assets/tinder.png'
import circlekImg from './assets/circlek.png'
import toyotaImg from './assets/toyota.png'
import instagramListImg from './assets/instagram-list.png'

const QUESTIONS = [
  { id: 'instagram', brand: 'Instagram', question: 'Have you ever had an Instagram account?', icon: instagramIcon, logo: instagramLogo },
  { id: 'yahoo', brand: 'Yahoo', question: 'Have you ever had a Yahoo account?', icon: yahooIcon, logo: yahooLogo },
  { id: 'juul', brand: 'Juul', question: 'Have you purchased a Juul device?', icon: juulIcon, logo: juulLogo },
  { id: 'apple', brand: 'Apple', question: 'Do you own any Apple devices?', icon: appleIcon, logo: appleLogo },
  { id: 'bumble', brand: 'Bumble', question: 'Have you used the dating app Bumble?', icon: bumbleIcon, logo: bumbleLogo },
  { id: 'plaid', brand: 'Plaid', question: 'Have you used Plaid to connect your bank account to apps like Venmo or Robinhood?', icon: plaidIcon, logo: plaidLogo },
  { id: 'ebay', brand: 'eBay', question: 'Have you ever had an eBay account?', icon: ebayIcon, logo: ebayLogo },
  { id: 'airbnb', brand: 'Airbnb', question: 'Have you ever booked a stay at an Airbnb?', icon: airbnbIcon, logo: airbnbLogo },
  { id: 'visa', brand: 'Visa or Mastercard', question: 'Did you use a Visa or Mastercard for ATM withdrawals in the U.S. between October 1, 2007 and July 26, 2024?', icon: visaMcIcon, logo: visaMcLogo },
]

const CLAIMS = [
  { id: 'tiktok', name: 'TikTok & Instagram', icon: tiktokImg, daysLeft: 186, who: 'Users <24yo', payout: '$1,000' },
  { id: 'flo', name: 'Flo', icon: floImg, daysLeft: 108, who: 'Flo app users', payout: '$25' },
  { id: 'spotify', name: 'Spotify', icon: spotifyImg, daysLeft: 154, who: 'Spotify users', payout: '$100' },
  { id: 'fortnite', name: 'Fortnite', icon: fortniteImg, daysLeft: 125, who: 'Your child is <16yo & plays often', payout: '$1,250' },
  { id: 'kirkland', name: 'Kirkland (Costco)', icon: kirklandImg, daysLeft: 216, who: 'Kirkland tequila customers', payout: '$250' },
  { id: 'grubhub', name: 'GrubHub', icon: grubhubImg, daysLeft: 141, who: 'Grubhub customers', payout: '$200' },
  { id: 'tinder', name: 'Tinder', icon: tinderImg, daysLeft: 50, who: 'Tinder Plus users 29yo+', payout: '$50' },
  { id: 'instagram', name: 'Instagram', icon: instagramListImg, daysLeft: 186, who: 'Users <24yo', payout: '$1,000' },
  { id: 'circlek', name: 'Circle K', icon: circlekImg, daysLeft: 66, who: 'Circle K customers', payout: '$50' },
  { id: 'toyota', name: 'Toyota Motor Corporation', icon: toyotaImg, daysLeft: 897, who: 'Toyota owners', payout: '$100' },
]

const CLAIM_QUESTIONS = {
  tiktok: [
    'Did you have an active TikTok account before June 2023?',
    'Were you under 24 years old (or a parent of a minor) during your TikTok use?',
    'Did TikTok use negatively impact your mental health, sleep, school, or work?',
    'Did your TikTok use continue for multiple months or longer before June 2023?',
  ],
  flo: [
    'Did you use Flo between November 1, 2016 and February 28, 2019?',
    'Did you enter menstruation or pregnancy information into the Flo app during that time?',
    'Were you unaware that Flo shared your health information with third parties like Facebook or Google?',
    'Did you use the Flo app while living in the United States?',
  ],
  spotify: [
    'Have you had a free or paid Spotify account?',
    'Did you use Spotify regularly over a period of multiple months?',
    'Did you listen to Spotify playlists or personalized recommendations?',
    'Did you use Spotify while located in the United States?',
  ],
  fortnite: [
    'Is the affected child between 5 and 16 years old?',
    'Did the child play video games more than 10 hours per week?',
    'Did gaming negatively impact the child\'s mental health, school performance, or behavior?',
    'Did the child attempt to reduce or stop gaming but struggle to do so?',
  ],
  kirkland: [
    'Did you purchase Kirkland Signature Tequila Blanco in the United States?',
    'Was the product labeled as "100% Blue Weber Agave" at the time of purchase?',
    'Would you have avoided or paid less for the product if the labeling were inaccurate?',
    'Did you purchase the product more than once based on the labeling or branding?',
  ],
  grubhub: [
    'Do you have a Grubhub account or use the Grubhub app/website?',
    'Have you used Grubhub to browse restaurants or place a food order?',
    'Were you unaware that Grubhub shared your activity or device data with third parties without your clear consent?',
    'Did you use Grubhub while located in the United States?',
  ],
  tinder: [
    'Have you purchased a Tinder Plus subscription?',
    'Did you subscribe to Tinder Plus between March 2, 2015 and February 10, 2019?',
    'Were you 29 or older at the time you purchased Tinder Plus?',
    'Did you purchase Tinder Plus while located in the United States?',
  ],
  instagram: [
    'Did you have an active TikTok account before June 2023?',
    'Were you under 24 years old (or a parent of a minor) during your TikTok use?',
    'Did TikTok use negatively impact your mental health, sleep, school, or work?',
    'Did your TikTok use continue for multiple months or longer before June 2023?',
  ],
  circlek: [
    'Did you receive a data breach notice from Circle K or Gas Express, LLC?',
    'Was your personal information potentially exposed in the May 2024 data incident?',
    'Did the breach notice indicate your name, contact, or payment information may have been accessed?',
    'Were you residing in the United States when you received the breach notice?',
  ],
  toyota: [
    'Do you own or lease, or did you previously own or lease, a Toyota Corolla, Corolla Matrix, Avalon, Tacoma, Tundra, or Sequoia?',
    'Is your Toyota a covered model year (Corolla 2011-2019, Avalon 2012-2018, Tacoma 2012-2019, Tundra 2012-2017, or Sequoia 2012-2017)?',
    'Did you own or lease the vehicle as of July 31, 2023?',
  ],
}

const PAYOUT_PER_YES = 45

function App() {
  const [step, setStep] = useState('intro-1')
  const [answers, setAnswers] = useState({})
  const [selectedClaims, setSelectedClaims] = useState([])
  const [formData, setFormData] = useState({ firstName: '', middleName: '', lastName: '', email: '', country: 'United States', city: '', state: '', zip: '' })
  const [currentClaimIndex, setCurrentClaimIndex] = useState(0)
  const [claimAnswers, setClaimAnswers] = useState({})

  const yesCount = Object.values(answers).filter(a => a === 'yes').length
  const missedAmount = yesCount * PAYOUT_PER_YES

  useEffect(() => {
    if (step === 'loading') {
      const timer = setTimeout(() => setStep('results'), 3000)
      return () => clearTimeout(timer)
    }
  }, [step])

  useEffect(() => {
    window.scrollTo(0, 0)
  }, [step])

  // Intro screens
  if (step === 'intro-1') {
    return (
      <div className="page">
        <img src={claimLogo} alt="Claim" className="claim-logo" style={{ marginBottom: 12 }} />
        <h1 className="intro-heading">
          There's <span className="accent">cash out</span> there with <span className="accent">your name on it</span>.
        </h1>
        <p className="intro-subtitle">Companies owe people money from lawsuits all the time. Most never claim it.</p>
        <img src={unclaimedFolder} alt="Unclaimed money" className="intro-image" />
        <button className="btn-next" style={{ marginTop: 20 }} onClick={() => setStep('intro-2')}>Next</button>
      </div>
    )
  }

  if (step === 'intro-2') {
    return (
      <div className="page">
        <img src={claimLogo} alt="Claim" className="claim-logo" style={{ marginBottom: 12 }} />
        <h1 className="intro-heading">
          We find the <span className="accent">payouts</span>. You get the <span className="accent">cash</span>
        </h1>
        <p className="intro-subtitle">We search for claims you're eligible for — just answer a few quick questions.</p>
        <img src={settlementCards} alt="Settlement cards" className="intro-image" />
        <button className="btn-next" style={{ marginTop: 20 }} onClick={() => setStep('intro-3')}>Next</button>
      </div>
    )
  }

  if (step === 'intro-3') {
    return (
      <div className="page">
        <img src={claimLogo} alt="Claim" className="claim-logo" style={{ marginBottom: 12 }} />
        <h1 className="intro-heading">
          We'll <span className="accent">track your claims</span> & tell you when you get <span className="accent">paid</span>.
        </h1>
        <p className="intro-subtitle">We update you on your claim & alert you when the payout hits.</p>
        <img src={claimTracker} alt="Claim tracker" className="intro-image" />
        <button className="btn-next" style={{ marginTop: 20 }} onClick={() => setStep('intro-4')}>Next</button>
      </div>
    )
  }

  if (step === 'intro-4') {
    return (
      <div className="page">
        <img src={claimLogo} alt="Claim" className="claim-logo" style={{ marginBottom: 12 }} />
        <h1 className="intro-heading">
          <span className="accent">$40M+</span> back to consumers.
        </h1>
        <p className="intro-subtitle">We've helped people file over 500,000 claims worth more than $40 million in payouts.</p>
        <img src={phoneNotifications} alt="Phone notifications" className="intro-image" />
        <button className="btn-next" style={{ marginTop: 20 }} onClick={() => setStep('intro-5')}>Next</button>
      </div>
    )
  }

  if (step === 'intro-5') {
    return (
      <div className="page">
        <img src={claimLogo} alt="Claim" className="claim-logo" style={{ marginBottom: 12 }} />
        <h1 className="intro-heading">
          <span className="accent">$1.2B</span> went unclaimed last year alone! 🚨
        </h1>
        <p className="intro-subtitle">Most customers forget to claim their settlements.</p>
        <img src={settlementUnclaimed} alt="Unclaimed settlements" className="intro-image" />
        <button className="btn-next" style={{ marginTop: 20 }} onClick={() => setStep('question-0')}>Next</button>
      </div>
    )
  }

  // Question screens
  const qMatch = step.match(/^question-(\d+)$/)
  if (qMatch) {
    const qIndex = parseInt(qMatch[1])
    const q = QUESTIONS[qIndex]
    const handleAnswer = (answer) => {
      setAnswers(prev => ({ ...prev, [q.id]: answer }))
      if (qIndex < QUESTIONS.length - 1) {
        setStep(`question-${qIndex + 1}`)
      } else {
        setStep('loading')
      }
    }

    return (
      <div className="page" style={{ padding: 0 }}>
        <div style={{ padding: '16px 16px 0' }}>
          <div className="header-row">
            <img src={claimLogo} alt="Claim" className="claim-logo" />
            <span className="question-counter">{qIndex + 1}/{QUESTIONS.length} questions</span>
          </div>
        </div>
        <div className="question-card-wrapper" style={{ padding: '0 16px 16px', flex: 1 }}>
          <div className="question-card" style={{ marginTop: 30 }}>
            <div className="question-card-header">
              <img src={claimLogo} alt="Claimed" style={{ width: 28, height: 28 }} />
              <span className="question-counter" style={{ background: '#fff', color: '#121212' }}>{qIndex + 1}/{QUESTIONS.length} questions</span>
            </div>
            <img src={q.icon} alt={q.brand} className="brand-icon-small" />
            <h2 className="question-text">
              {q.question.split(q.brand).map((part, i, arr) => (
                <span key={i}>
                  {part}
                  {i < arr.length - 1 && <span className="accent">{q.brand}</span>}
                </span>
              ))}
            </h2>
            <img src={q.logo} alt={q.brand} className="brand-logo-large" />
            <div className="answer-buttons">
              <button className="btn-answer" onClick={() => handleAnswer('yes')}>Yes</button>
              <button className="btn-answer" onClick={() => handleAnswer('no')}>No</button>
              <button className="btn-answer" onClick={() => handleAnswer('skip')}>Prefer not to say</button>
            </div>
          </div>
        </div>
      </div>
    )
  }

  // Loading screen
  if (step === 'loading') {
    return (
      <div className="loading-screen">
        <img src={claimLogo} alt="Claim" className="claim-logo" style={{ position: 'absolute', top: 16, left: 16 }} />
        <div className="loading-icon">🌐</div>
        <h2 className="loading-heading">Calculating your estimated <span className="accent">payout</span></h2>
        <p className="loading-subtitle">Running payout optimization</p>
      </div>
    )
  }

  // Results - missed out
  if (step === 'results') {
    return (
      <div className="results-screen">
        <div className="results-emoji">💸</div>
        <h2 className="results-heading">Based on your answers you missed out on...</h2>
        <div className="results-amount">${missedAmount}</div>
        <p className="results-subtitle">This is an approximation based on the payouts from the brands you selected</p>
        <button className="btn-next" style={{ marginTop: 40, maxWidth: 358 }} onClick={() => setStep('unclaimable')}>Next</button>
      </div>
    )
  }

  // Unclaimable
  if (step === 'unclaimable') {
    return (
      <div className="results-screen">
        <div className="results-emoji">⛔</div>
        <h2 className="results-heading">Unfortunately that <span className="accent" style={{ color: '#90D5FF' }}>${missedAmount}</span> is now unclaimable</h2>
        <p className="results-subtitle">You missed the claim deadline. The claim windows are normally open for 3-12 months.</p>
        <button className="btn-next" style={{ marginTop: 40, maxWidth: 358 }} onClick={() => setStep('brands')}>Next</button>
      </div>
    )
  }

  // Brands circle
  if (step === 'brands') {
    return (
      <div className="brands-screen">
        <div style={{ flex: 1, display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
          <BrandsCircle heading="Plenty of active claims are still open!" />
          <p className="brands-subtitle" style={{ textAlign: 'center', padding: '0 32px', marginTop: -8 }}>
            You still have time! Claimed will show you dozens of settlements available today.
          </p>
        </div>
        <button className="btn-next" style={{ marginTop: 20 }} onClick={() => setStep('choose-claims')}>Get Started</button>
      </div>
    )
  }

  // Choose claims
  if (step === 'choose-claims') {
    const totalPayout = selectedClaims.reduce((sum, id) => {
      const claim = CLAIMS.find(c => c.id === id)
      return sum + parseInt(claim.payout.replace(/[$,]/g, ''))
    }, 0)

    const toggleClaim = (id) => {
      setSelectedClaims(prev => prev.includes(id) ? prev.filter(x => x !== id) : [...prev, id])
    }

    return (
      <div className="claims-list-screen">
        <div className="claim-logo-center">
          <img src={claimLogo} alt="Claim" className="claim-logo" />
        </div>
        <h2 className="claims-title">Choose From These Claims</h2>
        <p className="claims-subtitle-text">You can always add more prior to the claim deadline.</p>

        {CLAIMS.map(claim => (
          <div key={claim.id} className={`claim-card ${selectedClaims.includes(claim.id) ? 'selected' : ''}`} onClick={() => toggleClaim(claim.id)}>
            <img src={claim.icon} alt={claim.name} className="claim-card-icon" />
            <div className="claim-card-info">
              <div className="claim-card-name">{claim.name}</div>
              <div className="claim-card-detail">📅 {claim.daysLeft} days left</div>
              <div className="claim-card-detail">👤 {claim.who}</div>
              <div className="claim-card-payout">✏️ Up to {claim.payout}</div>
            </div>
            <div className={`claim-card-checkbox ${selectedClaims.includes(claim.id) ? 'checked' : ''}`}>
              {selectedClaims.includes(claim.id) && '✓'}
            </div>
          </div>
        ))}

        {selectedClaims.length > 0 && (
          <div className="bottom-bar">
            <div className="bottom-bar-info">
              <span className="bottom-bar-count">{selectedClaims.length} selected</span>
              <span className="bottom-bar-amount">${totalPayout.toLocaleString()}</span>
            </div>
            <button className="btn-next" onClick={() => setStep('form')}>Next</button>
          </div>
        )}
      </div>
    )
  }

  // Form
  if (step === 'form') {
    const selectedClaimData = selectedClaims.map(id => CLAIMS.find(c => c.id === id))

    return (
      <div className="form-screen">
        <div className="claim-logo-center">
          <img src={claimLogo} alt="Claim" className="claim-logo" />
        </div>
        <h2 className="form-heading">Fill out your details</h2>
        <p className="form-subtitle">We'll save your info to make claiming quick and easy. We'll reuse these details for all claims.</p>

        <p style={{ fontSize: 13, color: '#667085', marginBottom: 8 }}>Selected claims</p>
        <div className="selected-claims-chips">
          {selectedClaimData.map(c => (
            <span key={c.id} className="chip">
              <img src={c.icon} alt={c.name} /> {c.name}
            </span>
          ))}
        </div>

        <h3 className="form-section-title">Claimant Information</h3>

        <div className="form-group">
          <label className="form-label">First Name <span className="required">*</span></label>
          <input className="form-input" value={formData.firstName} onChange={e => setFormData(p => ({ ...p, firstName: e.target.value }))} />
        </div>
        <div className="form-group">
          <label className="form-label">Middle Name (optional)</label>
          <input className="form-input" placeholder="Middle Name (optional)" value={formData.middleName} onChange={e => setFormData(p => ({ ...p, middleName: e.target.value }))} />
        </div>
        <div className="form-group">
          <label className="form-label">Last Name (optional)</label>
          <input className="form-input" value={formData.lastName} onChange={e => setFormData(p => ({ ...p, lastName: e.target.value }))} />
        </div>
        <div className="form-group">
          <label className="form-label">Email Address <span className="required">*</span></label>
          <input className="form-input" type="email" value={formData.email} onChange={e => setFormData(p => ({ ...p, email: e.target.value }))} />
        </div>

        <div className="form-group">
          <label className="form-label">Country (optional)</label>
          <select className="form-select" value={formData.country} onChange={e => setFormData(p => ({ ...p, country: e.target.value }))}>
            <option>United States</option>
            <option>Canada</option>
            <option>United Kingdom</option>
          </select>
        </div>
        <div className="form-group">
          <label className="form-label">City (optional)</label>
          <input className="form-input" value={formData.city} onChange={e => setFormData(p => ({ ...p, city: e.target.value }))} />
        </div>
        <div className="form-group">
          <label className="form-label">State (optional)</label>
          <select className="form-select" value={formData.state} onChange={e => setFormData(p => ({ ...p, state: e.target.value }))}>
            <option value="">Select state</option>
            <option>New York</option>
            <option>California</option>
            <option>Texas</option>
            <option>Florida</option>
          </select>
        </div>
        <div className="form-group">
          <label className="form-label">ZIP / Postal Code (optional)</label>
          <input className="form-input" value={formData.zip} onChange={e => setFormData(p => ({ ...p, zip: e.target.value }))} />
        </div>

        <button className="btn-next blue" style={{ marginTop: 8, marginBottom: 24 }} onClick={() => { setCurrentClaimIndex(0); setStep('claim-form') }}>Next</button>
      </div>
    )
  }

  // Claim forms
  if (step === 'claim-form') {
    const claimId = selectedClaims[currentClaimIndex]
    const claim = CLAIMS.find(c => c.id === claimId)
    const questions = CLAIM_QUESTIONS[claimId] || []
    const isLast = currentClaimIndex === selectedClaims.length - 1
    const progress = ((currentClaimIndex + 1) / selectedClaims.length) * 100

    const currentAnswers = claimAnswers[claimId] || {}

    const handleClaimAnswer = (qIdx, answer) => {
      setClaimAnswers(prev => ({
        ...prev,
        [claimId]: { ...(prev[claimId] || {}), [qIdx]: answer }
      }))
    }

    const goNext = () => {
      if (isLast) {
        setStep('thankyou')
      } else {
        setCurrentClaimIndex(prev => prev + 1)
      }
    }

    const skip = () => {
      if (isLast) {
        setStep('thankyou')
      } else {
        setCurrentClaimIndex(prev => prev + 1)
      }
    }

    return (
      <div className="claim-form-screen">
        <div className="claim-logo-center">
          <img src={claimLogo} alt="Claim" className="claim-logo" />
        </div>
        <div className="progress-bar">
          <div className="progress-fill" style={{ width: `${progress}%` }} />
        </div>
        <h2 className="claim-form-title">Claim {currentClaimIndex + 1} of {selectedClaims.length}: {claim.name}</h2>
        <p className="claim-form-subtitle">Let's practice submitting your first claims.</p>

        {questions.map((q, idx) => (
          <div key={idx} className="claim-question">
            <p className="claim-question-text">{q}</p>
            <div className="claim-question-buttons">
              <button
                className={`btn-yes-no ${currentAnswers[idx] === 'yes' ? 'selected-yes' : ''}`}
                onClick={() => handleClaimAnswer(idx, 'yes')}
              >Yes</button>
              <button
                className={`btn-yes-no ${currentAnswers[idx] === 'no' ? 'selected-no' : ''}`}
                onClick={() => handleClaimAnswer(idx, 'no')}
              >No</button>
            </div>
          </div>
        ))}

        <div className="claim-form-bottom">
          <button className="btn-skip" onClick={skip}>Skip for now</button>
          <button className="btn-complete" onClick={goNext}>
            {isLast ? 'Complete' : 'Next Claim'}
          </button>
        </div>
      </div>
    )
  }

  // Thank you
  if (step === 'thankyou') {
    return (
      <div className="thankyou-screen">
        <div className="thankyou-emoji">🎉</div>
        <h2 className="thankyou-heading">You're all set!</h2>
        <p className="thankyou-text">Your claims have been submitted. We'll track them and notify you when payouts are available.</p>
      </div>
    )
  }

  return null
}

export default App
