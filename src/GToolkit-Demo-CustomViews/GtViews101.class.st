"
I am presentation about custom views.
"
Class {
	#name : #GtViews101,
	#superclass : #Object,
	#category : #'GToolkit-Demo-CustomViews'
}

{ #category : #accessing }
GtViews101 class >> start [
	^ BlSpace new addChild: self new create asElement; show.
]

{ #category : #'api - instantiation' }
GtViews101 >> create [
	| show |
	show := GtSlideShow new.
	show slides: {
		(GtFilePictureSlide new fileReference:
			(GtIcebergUtility documentAtPath:
				Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'gtoolkit.png')).
		(GtTitleSlide new titleText:
			('custom views' asRopedText
				fontSize: 50;
				glamorousRegularFont)).
		(GtTextAndElementSlide new
			element: [GtRawViewsSlide new asElement ];
			textWithFormat:
				('Views give us specific representations for the objects we are inspecting'
					asRopedText
					glamorousRegularFont;
					fontSize: 20;
					foreground: Color gray)).
		(GtTextAndElementSlide new
			element: [self makeAsBlElement: (HotelExamples new hotelWithOneRoom gtRawFor: GtPhlowView empty)];
			textWithFormat: 
				('For example, look at the following raw view for an Hotel object'
					asRopedText
					glamorousRegularFont;
					fontSize: 20;
					foreground: Color gray)).
		(GtTextSlide new
			firstTextWithFormat:
				('But that view does not say a lot'
					asRopedText
					glamorousRegularFont;
					fontSize: 20)).
		(GtTextAndElementSlide new
			element: [self makeAsBlElement: (HotelExamples new hotelWithThreeRooms gtRoomsFor: GtPhlowView empty)];
			textWithFormat:
				('So how about one that shows the rooms in the hotel?'
					asRopedText
					glamorousRegularFont;
					fontSize: 20;
					foreground: Color gray)).
		(GtElementSlide new 
			element: [GtViewsPresentationExamples new inspectorOnHotelObjectExample]).
		(GtTextAndElementSlide new 
			element: [GtPlaygroundSlide new
				snippets: {'#gtView gtPragmas'}; asElement];
			textWithFormat: 
				('Inspect this querry to see more examples of views implementation' 
					asRopedText
					glamorousRegularFont;
					fontSize: 20;
					foreground: Color gray)).
		(GtElementSlide new
			element: [GtViewsPresentationExamples new pragmasMetricsViewExample]).
		(GtTextSlide new
			firstTextWithFormat:
				('Now lets use an address book.' 
					asRopedText
					glamorousRegularFont;
					fontSize: 20);
			secondTextWithFormat:
				('And lets say we want to see the contacts in it.'
					asRopedText
					glamorousRegularFont;
					fontSize: 20)).
		(GtTextAndElementSlide new
			element: [self makeAsBlElement: 
				((GtABAddressBook>>#gtViewContactsIconsCircularOn:) gtSourceFor: GtPhlowView empty)];
			textWithFormat:
				('So in only 13 lines of code'
					asRopedText
					glamorousRegularFont;
					foreground: Color gray;
					fontSize: 20)).
		(GtTextAndElementSlide new
			element: [self makeAsBlElement: 
				(GtABCartoonAddressBookExample new cartoonAddressBook gtViewContactsIconsCircularOn: GtPhlowView empty)];
			textWithFormat:
				('we got an interesting visualization'
					asRopedText
					glamorousRegularFont;
					foreground: Color gray;
					fontSize: 20)).
		(GtTitleSlide new
			title:
				('Now lets see how do we create these views'
					asRopedText
					glamorousRegularFont;
					fontSize: 20)).
		(GtElementSlide new
			element: [GtViewsPresentationExamples new viewCodeExample]).
		(GtElementSlide new
			element: [GtViewsPresentationExamples new viewListCodeExample]).
		(GtTextAndElementSlide new
			element: [self makeAsBlElement: 
				(GtComputersNetworkExamples new networkWithTwoComputers gtNetworksIpsViewFor: GtPhlowView empty)];
			text: 'List view example' asRopedText).
		(GtElementSlide new
			element: [GtViewsPresentationExamples new viewColumnedListCodeExample]).
		(GtTextAndElementSlide new
			element: [self makeAsBlElement: 
				(GtComputersNetworkExamples new networkWithTwoComputers gtNetworksComputersViewFor: GtPhlowView empty)];
			text: 'ColumnedList view example' asRopedText).
		(GtElementSlide new
			element: [GtViewsPresentationExamples new viewMondrianCodeExample]).
		(GtTextAndElementSlide new
			element: [self makeAsBlElement: 
				(GtComputersNetworkExamples new networkWithThreeComputers gtSchematicViewFor: GtPhlowView empty)];
			text: 'Mondrian view example' asRopedText).
		(GtTitleSlide new titleText:
			('Have fun visualizing' asRopedText
				glamorousRegularFont;
				foreground: Color black;
				fontSize: 50)) }.
	
	^ show
]

{ #category : #utilities }
GtViews101 >> makeAsBlElement: aView [
	^ ((aView) asElementDo: [:e |
		BlElement new
			look: BrShadowLook;
			background: Color white;
			margin: (BlInsets all: 20);
			addChild: e]) size: 400@400.
]
