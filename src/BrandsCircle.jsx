import pepsi from './assets/brands/pepsi.png'
import etsy from './assets/brands/etsy.png'
import airbnbC from './assets/brands/airbnb-c.png'
import life360 from './assets/brands/life360.png'
import att from './assets/brands/att.png'
import gamestop from './assets/brands/gamestop.png'
import chobani from './assets/brands/chobani.png'
import cashapp from './assets/brands/cashapp.png'
import cvs from './assets/brands/cvs.png'
import dailywire from './assets/brands/dailywire.png'
import fortniteB from './assets/brands/fortnite.png'
import similisan from './assets/brands/similisan.png'
import appleB from './assets/brands/apple.png'
import keurig from './assets/brands/keurig.png'
import amazon from './assets/brands/amazon.png'
import poppi from './assets/brands/poppi.png'
import neimanmarcus from './assets/brands/neimanmarcus.png'
import fubo from './assets/brands/fubo.png'
import tiktokB from './assets/brands/tiktok.png'
import viki from './assets/brands/viki.png'
import toyotaB from './assets/brands/toyota.png'
import tmobile from './assets/brands/tmobile.png'
import wholefoods from './assets/brands/wholefoods.png'

const BRAND_CARDS = [
  { src: cvs, x: 156.05, y: 28, w: 77.9, h: 58.9, rot: 0 },
  { src: wholefoods, x: 35.34, y: 70.14, w: 95.12, h: 85.49, rot: -15 },
  { src: dailywire, x: 283.5, y: 38.45, w: 95.12, h: 85.49, rot: 10 },
  { src: tmobile, x: -57.2, y: 157.89, w: 95.9, h: 97.3, rot: -25 },
  { src: pepsi, x: 161.75, y: 121.1, w: 66.5, h: 49.4, rot: 0 },
  { src: cashapp, x: 21.97, y: 206, w: 81.95, h: 81.95, rot: -10 },
  { src: etsy, x: 321, y: 158.97, w: 81.95, h: 81.95, rot: 15 },
  { src: fortniteB, x: 395.07, y: 100, w: 95.9, h: 97.3, rot: 20 },
  { src: similisan, x: 472.22, y: 201.31, w: 80.09, h: 92.29, rot: 10 },
  { src: toyotaB, x: -106.29, y: 275.39, w: 80.09, h: 92.29, rot: -20 },
  { src: viki, x: -52.43, y: 318.68, w: 66.72, h: 83.63, rot: -15 },
  { src: chobani, x: -15.9, y: 365.25, w: 49.4, h: 66.5, rot: -5 },
  { src: airbnbC, x: 356.5, y: 365.25, w: 49.4, h: 66.5, rot: 10 },
  { src: appleB, x: 501.01, y: 324.84, w: 66.72, h: 83.63, rot: 15 },
  { src: life360, x: 286.07, y: 470.1, w: 81.95, h: 81.95, rot: 10 },
  { src: tiktokB, x: -36.47, y: 421.29, w: 89.96, h: 96.91, rot: -20 },
  { src: gamestop, x: 56.9, y: 423.07, w: 81.95, h: 81.95, rot: -10 },
  { src: keurig, x: 387.52, y: 488.76, w: 89.96, h: 96.91, rot: 15 },
  { src: att, x: 161.75, y: 493.5, w: 66.5, h: 49.4, rot: 0 },
  { src: fubo, x: 19.3, y: 507.58, w: 97.64, h: 93.44, rot: -15 },
  { src: amazon, x: 307.68, y: 553.37, w: 97.64, h: 93.44, rot: 10 },
  { src: poppi, x: 207.78, y: 580.14, w: 88.44, h: 73.81, rot: 5 },
  { src: neimanmarcus, x: 106.02, y: 563.95, w: 88.44, h: 73.81, rot: -5 },
]

const FIGMA_CENTER_X = 195
const SCALE = 0.62

const FIGMA_CIRCLE_CENTER_Y = 332

export default function BrandsCircle({ heading, subtitle, onGetStarted }) {
  const viewH = 660 * SCALE

  return (
    <div style={{
      position: 'relative',
      width: '100%',
      height: viewH,
      overflow: 'visible',
    }}>
      {/* Dashed circles */}
      <div style={{
        position: 'absolute',
        top: (FIGMA_CIRCLE_CENTER_Y - 274.5) * SCALE,
        left: '50%',
        transform: 'translateX(-50%)',
        width: 549 * SCALE,
        height: 549 * SCALE,
        borderRadius: '50%',
        border: '1px dashed rgba(209,213,219,0.5)',
      }} />
      <div style={{
        position: 'absolute',
        top: (FIGMA_CIRCLE_CENTER_Y - 185.7) * SCALE,
        left: '50%',
        transform: 'translateX(-50%)',
        width: 371 * SCALE,
        height: 371 * SCALE,
        borderRadius: '50%',
        border: '1px dashed rgba(209,213,219,0.3)',
      }} />

      {/* Brand cards */}
      {BRAND_CARDS.map((card, i) => {
        const centerOffsetX = card.x + card.w / 2 - FIGMA_CENTER_X
        const leftPx = `calc(50% + ${centerOffsetX * SCALE}px - ${card.w * SCALE / 2}px)`

        return (
          <img
            key={i}
            src={card.src}
            alt=""
            style={{
              position: 'absolute',
              left: leftPx,
              top: card.y * SCALE,
              width: card.w * SCALE,
              height: card.h * SCALE,
              borderRadius: 6,
              transform: `rotate(${card.rot}deg)`,
              objectFit: 'cover',
              boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
            }}
          />
        )
      })}

      {/* Heading overlaid in center of circle */}
      {heading && (
        <div style={{
          position: 'absolute',
          top: (FIGMA_CIRCLE_CENTER_Y - 40) * SCALE,
          left: '50%',
          transform: 'translateX(-50%)',
          width: 160,
          textAlign: 'center',
          pointerEvents: 'none',
          zIndex: 10,
        }}>
          <h2 className="brands-heading" style={{ margin: 0 }}>{heading}</h2>
        </div>
      )}
    </div>
  )
}
