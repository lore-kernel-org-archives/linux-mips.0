Reply-To: <a.voropay@vmb-service.ru>
From: "Alec Voropay" <a.voropay@vmb-service.ru>
Subject: RE: anybody tried NPTL?
Date: Mon, 23 Aug 2004 19:09:31 +0400
Message-ID: <036001c48923$31563350$1701a8c0@alec>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040823122843.GB20905@linux-mips.org>
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040823150931.1Ikkbtfk5gn7VZYdL-pyo6-21sa_iFd7Ki6yEyYGLyg@z>

Ralf Baechle [mailto:ralf@linux-mips.org] wrote:

> In addition to what Dom has already answered - there are very 
> significant differences between the multithreading as
> implemented in the  Windows OS family and the varioius
> threading implementations for Linux  like classic
> libpthreads, Linuxthreads, NPTL, Mozilla and more.
> If we legally could look at MS's code I'd not expect to find
> much useful for us there ...

 OK, OK. You are right. However, as it is known, there is at
least one project "to bridge" Win32/multithread and *NIX :
 WINE.
http://winehq.com/site/docs/wine-devel/x3398

 Yes, the Win32/MIPS API (and ABI) is dead, but MIPS/multithreading
lives in the WindowsCE/MIPS HPCs.


 Unfortunately, I can't find any details about Win32/MIPS
implementation.


--
-=VA=-
