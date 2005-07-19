MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: SNR calculation in stv0299 driver
Content-class: urn:content-classes:message
Date: Tue, 19 Jul 2005 17:08:10 +0100
Message-ID: <CEA5455795C8AA44AA1E18EF32379B210BA979@exterity-serv1.Exterity.local>
From: "Gill Robles-Thome" <gill.robles@exterity.co.uk>
Return-Path: <gill.robles@exterity.co.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050719160810.y8Mlgi3aT24QtgKJnV560V5YAYnTAiiuVYLa3_wpcJs@z>

Hi -

Can anyone explain the algorithm used to calculate the SNR for the
stv0299 driver? Ie


	case FE_READ_SNR:
	{
		s32 snr = 0xffff - ((stv0299_readreg (i2c, 0x24) << 8)
				   | stv0299_readreg (i2c, 0x25));
		snr = 3 * (snr - 0xa100);
		*((u16*) arg) = (snr > 0xffff) ? 0xffff :
				(snr < 0) ? 0 : snr;
		break;
	}
 

I don't understand where the 0xa100 value comes from, or why the result
is them multiplied by 3!  Registers 0x24 and 0x25 are apparently "Noise
Indicator" registers, but the stv0299 specification doesn't explain very
well how these registers should be used.

Thanks for your help,
Gill
