From: "James McD" <vile8@hotmail.com>
Subject: Fwd: pthread in glibc 2.2.1
Date: Mon, 22 Jan 2001 00:07:32 
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_1656_4a88_499f"
Message-ID: <F69IBJYduiFPUEOYMui000010a7@hotmail.com>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010122000732.0ZEAsa1tf2Rsl5hqXT1C3odUbeNEM5yQSlLlj6fxpZU@z>

This is a multi-part message in MIME format.

------=_NextPart_000_1656_4a88_499f
Content-Type: text/plain; format=flowed

From what I have seen the gdb bombs out on 90% of pthread programs as
well. This includes all platforms as far as I am aware. There is a fix
posted on bugzilla stating you need to recompile the gdb from the cvs tree 
and that should fix. However I have had mixed luck.
Hope that helps somewhat!

Sincerely,

James McDermott
>
>Hi,
>even the simplest pthread-program dies with a bus error(see attachment)
>on my I2.  glibc is 2.2.1(same for 2.1.97), kernel is 2.4.0-test9.
>Interesting enough I can't even get a core dump. Any starting points to
>track this down?
>Regards,
>  -- Guido

_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com

------=_NextPart_000_1656_4a88_499f
Content-Type: text/plain; charset=us-ascii
Content-Description: pthread_create.c
Content-Disposition: attachment; filename="pthreadcreate.c.orig"

#include <pthread.h>
#ifndef NULL
#define NULL (void*)0
#endif

static void *task(p)
	void *p;
{
	return (void *) (p == NULL);
}

int main(argc, argv)
	int argc;
	char **argv;
{
	pthread_t t;
	exit(pthread_create(&t, NULL, task, NULL));
}



------=_NextPart_000_1656_4a88_499f--
