content-class: urn:content-classes:message
Subject: set_bit() function.
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Date: Mon, 6 Aug 2001 11:04:38 -0700
Message-ID: <84CE342693F11946B9F54B18C1AB837B0A21EB@ex2k.pcs.psdc.com>
From: "Steven Liu" <stevenliu@psdc.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010806180438.TFuYluO-afLEO4YaTnQofqReVYASJ-u8P1egX8j-6mY@z>

Hi, ALL:

I have a question regarding the function set_bit() in
linux/include/asm-mips/bitops.h for MIPS 1(R3000).

extern __inline__ void set_bit(int nr, void * addr)
{
	int	mask;
	int	*a = addr;
	__bi_flags;

	a += nr >> 5;                        // <---- why shits right 5
bits? 
	mask = 1 << (nr & 0x1f);
	__bi_save_flags(flags);
	__bi_cli();
	*a |= mask;
	__bi_restore_flags(flags);
}

In

extern __inline__ int test_bit(int nr, const void *addr)
{
	return ((1UL << (nr & 31)) & (((const unsigned int *) addr)[nr
>> 5])) != 0;
}

addr is always passed in as a pointer to an integer. Why does it use
array [nr >>5]?

Any help is greatly appreciated.

Thanks.

Steven Liu
