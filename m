Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: PMON - IdentifyFlashType
Date: Thu, 25 Mar 2004 16:25:03 +0100
Message-ID: <765921A8173EC145948ACBAA0480F67E2C76D6@server10.dallmeier.de>
From: "erras stefan" <stefan.erras@dallmeier-electronic.com>
Return-Path: <stefan.erras@dallmeier-electronic.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040325152503.bovcQ2A2o9Y8mkS_K2tE01-KzUs-81BJzfskFKfCKm8@z>

Can anybody of you great guys can explain me the folling function which
I found in PMON:

BOOL IdentifyFlashType()
{
	ULONG	mId, dId;

	WRITE_REGISTER_ULONG(FLASH_START, 0x90909090);
	mId = READ_REGISTER_ULONG(FLASH_START);
	WRITE_REGISTER_ULONG(FLASH_START, 0x90909090);
	dId = READ_REGISTER_ULONG(FLASH_START+4);
	
	if ((mId == 0x00890089) && (dId == 0x00180018)) 
	{
		FlashType = 1;		// J3 flash
		WRITE_REGISTER_ULONG(FLASH_START, 0x00ff00ff);
		printf("J3 32MB flash found on this platform\r\n");
		return TRUE;
	}	
	else if ((mId == 0x00890089) && (dId == 0x00170017)) 
	{	 
		FlashType = 1;		// J3 flash
		WRITE_REGISTER_ULONG(FLASH_START, 0x00ff00ff);
		printf("J3 16MB flash found on this platform\r\n");
		return TRUE;
	}
	return FALSE;
}

I have to know what the WRITE_REGISTER_ULONG and READ_REGISTER_ULONG
functions do affect.
Why do they write 0x90909090 or 0x00ff00ff to FLASH_START?
Whats the meaning of mId and dId?

Thank you all in advance for your help!!!

Greetings
Stefan
